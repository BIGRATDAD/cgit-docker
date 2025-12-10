## This is for syntax highlighting
# Get the name of the file and the extension of it
BASENAME="$1"
EXTENSION="${BASENAME##*.}"

[ "${BASENAME}" = "${EXTENSION}" ] && EXTENSION=txt
[ -z "${EXTENSION}" ] && EXTENSION=txt

# Makefile and Makefile.* are all .mk
[ "${BASENAME%%.*}" = "Makefile" ] && EXTENSION=mk

# User note: highlight v2 and v3 have different command options
# -X is replaced by "-O xhtml" in v3

# If for whatever reason, this container is using EPEL5 (it shouldn't),
# use the following line instead of the bottom line
# exec highlight --force -f -I -X -S "$EXTENSION" 2>/dev/null

# EPEL6 version with no inline css
# exec highlight --force  -f -I -O xhtml -S "EXTENSION" 2>/dev/null

# highlight v3 is available on EPEL6
exec highlight --force --inline-css -f -I -O xhtml -S "EXTENSION" 2>/dev/null