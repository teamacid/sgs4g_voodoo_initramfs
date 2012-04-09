# Voodoo lagfix extension

name='bootanimation binary from RaverX3X'
binary_source='/voodoo/extensions/bootanimation/bootanimation'
binary_dest='/system/bin/bootanimation'

extension_install_bootanimation()
{
	cp $binary_source $binary_dest
	# make sure it's owned by root
	chown 0.0 $binary_dest
	# sets the right permission
	chmod 0755 $binary_dest
	log "$name now installed"
}

install_condition()
{
	test -d "/system/xbin"
}


if install_condition; then
	# test if the bootanimation binary already exist in bin
	if test -u $binary_dest; then
		# okay, the bootanimation binary exist
		if test $source -nt $dest; then

			# but it's older than ours ! let's updated it
			extension_install_bootanimation
		else
			# ours is the same or older, don't touch it
			log "$name already installed"
		fi
	else
		# not here or not setup properly, let's install bootanimation
		extension_install_bootanimation
	fi
else
	log "$name cannot be installed"
fi
