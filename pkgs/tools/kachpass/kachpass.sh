#! @shell@
PASS_PATH=$1
TIMEOUT=$2
: "${KEYRING_PREFIX:="@keyringPrefix@"}"
: "${KEYRING:="@keyringType@"}"
: "${SPECIAL_KEYRING_STORAGE:="@targetKeyring@"}"
: "${KACHPASS_DEBUG:=0}"

KEYRING_PASS_PATH="$KEYRING_PREFIX/$PASS_PATH"
KEYRING_FULL_PATH="%$KEYRING:$KEYRING_PASS_PATH"

usage() {
	echo "Usage: kachpass [pass-name]"
}

if [ -z "$PASS_PATH" ]; then
	usage
	exit 1
fi

if [ "$KACHPASS_DEBUG" -ne 0 ]; then
	echo "[debug] keyring full path: $KEYRING_FULL_PATH"
	echo "[debug] target keyring: $SPECIAL_KEYRING_STORAGE"
fi

# ask for the keyring if the pass path already exist.
# if so, returns it immediately.
KEYRING_PASSWORD=$(keyctl pipe "$KEYRING_FULL_PATH")

# if not, ask for password store to provide us.
if [ $? -ne 0 ]; then
	# then, cache it in the keyring @us.
	@pass@/bin/pass show "$PASS_PATH" | keyctl padd "$KEYRING" "$KEYRING_PASS_PATH" "$SPECIAL_KEYRING_STORAGE"
	# if failed, crash.
	[ $? -ne 0 ] && echo "Fatal error: cannot fetch data from password store." && exit 1
fi

KEYRING_PASSWORD=$(keyctl pipe "$KEYRING_FULL_PATH")

# if not, there is a problem, crash.
if [ $? -ne 0 ]; then
	echo "Fatal error: cannot read written key, check default permissions or target keyring."
	exit 1
fi

echo "$KEYRING_PASSWORD"

# if necessary, put a timeout on it.
if [ ! -z "$TIMEOUT" ] ; then
	keyctl timeout "$KEYRING_FULL_PATH"
fi
