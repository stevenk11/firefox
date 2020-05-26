ibus-daemon -drx
if [ -e /dev/snd ]; then
	apulse firefox "$@"
else
	firefox "$@"
fi
