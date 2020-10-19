# Tools for defining modules for inspircd

{ pkgs }: {
  makeContribModule = { name, ext ? "cpp", repo ? pkgs.fetchFromGitHub {
    owner = "flopraden";
    repo = "inspircd-contrib";
    rev = "master";
    sha256 = "1npzp23c3ac7m1grkm39i1asj04rs4i0jwf5w0c0j0hmnwslnz7a";
  }, buildDeps ? [ ], path ? "/3.0", }: {
    "name" = name;
    "ext" = ext;
    "buildDeps" = buildDeps;
    "repo" = repo;
    "path" = path;
  };
  makeExtraModule = { name, ext ? "cpp", buildDeps ? [ ], }: {
    "name" = name;
    "ext" = ext;
    "buildDeps" = buildDeps;
    "intree" = true;
  };
}
