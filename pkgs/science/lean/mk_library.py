import argparse
import zipfile
import os
import subprocess
import json
import re
from pathlib import Path

parser = argparse.ArgumentParser(
    description=(
        "Create a library.zip olean bundle and corresponding JSON files with"
        " metadata for the lean-web-editor from a lean package."
    )
)
parser.add_argument(
    "-i",
    metavar="path/to/combined_lib",
    type=str,
    nargs="?",
    help="Lean package to bundle (default: combined_lib)",
    default="combined_lib",
)
parser.add_argument(
    "-o",
    metavar="path/to/library.zip",
    type=str,
    nargs="?",
    help=(
        "output zip file (default: dist/library.zip); metadata filenames are"
        " generated by stripping .zip from this argument and appending"
        " .info.json and .olean_map.json"
    ),
    default="dist/library.zip",
)
parser.add_argument(
    "-c",
    action="store_true",
    help=(
        "if this flag is present, only the core library will be included in"
        " the bundle"
    ),
)

parser.add_argument(
    "-t",
    action="store_true",
    help=(
        "if this flag is present, use old oleans during build."
    ),
)

args = parser.parse_args()
combined_lib = args.i
combined_lib_path = str(Path(combined_lib).resolve()) + "/src"
library_zip_fn = str(Path(args.o).resolve())

if not args.c:
    os.chdir(combined_lib)
    subprocess.call(["lean"] + (["--old-oleans"] if args.t else []) + ["--force-show-progress", "--make", "src"])

lean_version = subprocess.run(
    ["lean", "-v"], capture_output=True, encoding="utf-8"
).stdout
print("Using lean version:", lean_version)
# do not use githash, it is unnecessary.
# lean_githash = re.search("commit ([a-z0-9]{12}),", lean_version).group(1)
# assume leanprover-community repo
core_url = (
    "https://raw.githubusercontent.com/leanprover-community/lean/{0}/library/"
    .format(lean_version)
)
core_name = "lean/library"

lean_p = json.loads(subprocess.check_output(["lean", "-p"]))
lean_path = [Path(p).resolve() for p in lean_p["path"]]

already_seen = set()
lib_info = {}
oleans = {}
num_olean = {}
Path(library_zip_fn).parent.mkdir(parents=True, exist_ok=True)
with zipfile.ZipFile(
    library_zip_fn,
    mode="w",
    compression=zipfile.ZIP_DEFLATED,
    allowZip64=False,
    compresslevel=9,
    strict_timestamps=False
) as zf:
    for p in lean_path:
        parts = p.parts
        if str(p.resolve()) == combined_lib_path:  # if using combined_lib/src
            lib_name = parts[-2]
            lib_info[lib_name] = "/library/" + lib_name
        elif parts[-1] != "library":
            # assume lean_path contains _target/deps/name/src
            lib_name = parts[-2]
            git_dir = str(p.parent) + "/.git"
            lib_rev = subprocess.run(
                ["git", "--git-dir=" + git_dir, "rev-parse", "HEAD"],
                capture_output=True,
                encoding="utf-8",
            ).stdout.rstrip()
            lib_repo_url = subprocess.run(
                [
                    "git",
                    "--git-dir=" + git_dir,
                    "config",
                    "--get",
                    "remote.origin.url",
                ],
                capture_output=True,
                encoding="utf-8",
            ).stdout.rstrip()
            # assume that repos are hosted at github
            lib_repo_match = re.search(
                r"github\.com[:/]([^\.]*)", lib_repo_url
            )
            if lib_repo_match:
                lib_repo = lib_repo_match.group(1)
                lib_info[
                    lib_name
                ] = "https://raw.githubusercontent.com/{0}/{1}/src/".format(
                    lib_repo, lib_rev
                )
            elif lib_repo_url:
                lib_info[lib_name] = lib_repo_url
            else:
                lib_info[lib_name] = "/library/" + lib_name
        else:
            lib_name = core_name
            lib_info[lib_name] = core_url
        if lib_name not in num_olean.keys():
            num_olean[lib_name] = 0
        for fn in p.glob("**/*.olean"):
            rel = fn.relative_to(p)
            # ignore transitive dependencies
            if "_target" in rel.parts:
                continue
            # ignore olean files from deleted / renamed lean files
            if not fn.with_suffix(".lean").is_file():
                continue
            elif rel in already_seen:
                print("duplicate: {0}".format(fn))
            else:
                zf.write(fn, arcname=str(rel))
                oleans[str(rel)[:-6]] = lib_name
                num_olean[lib_name] += 1
                already_seen.add(rel)
        if num_olean[lib_name] == 0:
            del lib_info[lib_name]
        else:
            print(
                "Added {0} olean files from {1}".format(
                    num_olean[lib_name], lib_name
                )
            )
print(
    "Created {0} with {1} olean files".format(
        library_zip_fn, len(already_seen)
    )
)

library_prefix = '.'.join(library_zip_fn.split(".")[:-1])
info_fn = library_prefix + ".info.json"
with open(info_fn, "w") as f:
    json.dump(lib_info, f, separators=(",", ":"))
    f.write("\n")
print("Wrote info to {0}".format(info_fn))

map_fn = library_prefix + ".olean_map.json"
with open(map_fn, "w") as f:
    json.dump(oleans, f, separators=(",", ":"))
    f.write("\n")
print("Wrote olean map to {0}".format(map_fn))
