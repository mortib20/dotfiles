#!/bin/bash
task=$1
packages=(spotify)

function print_usage {
	echo "Usage: $0 download | build | install | update | clean"
	exit -1
}

function task_download {
	echo "Cloning AUR Packages"
	for pack in ${packages[@]}
	do
		if [ -d $pack ]
		then
			echo "$pack already cloned - skipping"
		else
			echo "Cloning $pack"
			git clone https://aur.archlinux.org/$pack.git
		fi
	done
}

function task_build {
	echo "Building AUR Packages"
	for pack in ${packages[@]}
	do
		echo "Building $pack"
		cd $pack
		makepkg -s -c -r
		cd ..
	done
}

function task_install {
	echo "Installing Packages"
	for pack in ${packages[@]}
	do
		echo "Installing $pack"
		cd $pack
		makepkg -i
		cd ..
	done
}

function task_update {
	echo "Updating Packages"
	for pack in ${packages[@]}
	do
		echo "Updating $pack"
		cd $pack
		git pull
	done
}

function task_clean {
	echo "Cleaning Packages"
	for pack in ${packages[@]}
	do
		echo "Cleaning $pack"
		cd $pack
		git clean -dfX
	done
}

if [ ! -d ~/AUR ]
then
	echo "Creating AUR Folder"
	mkdir -v ~/AUR
fi

case "$task" in
	download)
		task_download
		;;
	build)
		task_build
		;;
	install)
		task_install
		;;
	update)
		task_update
		;;
	clean)
		task_clean
		;;
	*)
		print_usage
esac
