#!/bin/sh

# Awk compile wrapper-script for 'compile.sh'.
# See that script for syntax and more info.
#
# This script does not actually "compile" the source, but writes a
# shell script that will function as the executable: when called, it
# will execute the source with the correct interpreter syntax, thus
# allowing this interpreted source to be used transparantly as if it
# was compiled to a standalone binary.
#
# NOTICE: this compiler script cannot be used with the USE_CHROOT
# configuration option turned on! (Unless proper preconfiguration of
# the chroot environment has been taken care of.)

DEST="$1" ; shift
MEMLIMIT="$1" ; shift
MAINSOURCE="$1"

# Check for '#!' interpreter line: don't allow it to prevent teams
# from passing options to the interpreter.
if grep '^#!' "$MAINSOURCE" >/dev/null 2>&1 ; then
	echo "Error: interpreter statement(s) found:"
	grep -n '^#!' "$MAINSOURCE"
	exit 1
fi

# There is no portable way to test the syntax of an awk script.

# Write executing script:
cat > $DEST <<EOF
#!/bin/sh
# Generated shell-script to execute awk interpreter on source.

# Detect dirname and change dir to prevent file not found errors.
if [ "\${0%/*}" != "\$0" ]; then
	cd "\${0%/*}"
fi

exec awk -v ONLINE_JUDGE=1 -v DOMJUDGE=1 -f "$MAINSOURCE"
EOF

chmod a+x $DEST

exit 0
