# Device configuration for Lenovo Yoga tablet 2-830L (YT2)

## Spec Sheet

| Feature                 | Specification                     |
| :---------------------- | :-------------------------------- |
| CPU                     | Quad-core 1.33 GHz |
| Chipset                 | Intel Atom Z3745 |
| GPU                     | Intel(R) HD Graphics for BayTrail; Intel; OpenGL ES-CM 1.1; OpenGL ES 3.1 - Build 1.0.0-R |
| Memory                  | 2048 MB |
| WiFi                    | bcm43241 |
| Shipped Android Version | 4.4.2 (upgrade 5.0.1) |
| Storage                 | 16 GB |
| MicroSD                 | Up to 64GB |
| Display                 | 1920 x 1200 pixels |
| Camera                  | 8 MP back Max: 3264x2448, 1,6 front Max size: 1440x1080 |

## Device Picture

![Lenovo Yoga 2](https://static.lenovo.com/na/subseries/hero/lenovo-yoga-tablet-2-hero.png "Lenovo Yoga 2")

----------

## How To Build

Although this device is not officially supported, the build-steps are not that different between devices. Most of the information on this "How to build" page also apply to this device:
https://wiki.lineageos.org/devices/bacon/build

Requirements:

- At least 8GB RAM (build will stop without a warning with 6GB)
- 65GB (sources and build results) [TODO enable ccache, than + 35GB (CCACHE)]

1. Install Docker (we will build in a container to have a clean environment)

1. Create the directories

	```sh
	$ mkdir -p ~/bin
	$ mkdir -p ~/android/system
	```
	
	*Note:* you can replace the build root "~/android/system" with any directory you like. Let's assume it is "~/android/system" in the following steps.

1. Install the repo command

	```sh
	$ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	$ chmod a+x ~/bin/repo
	```

1. Put the ~/bin directory in your path of execution

1. Initialize the LineageOS source repository

	```sh
	$ cd ~/android/system/
	$ repo init -u https://github.com/LineageOS/android.git -b lineage-15.1
	```

1. Download the source code

	```sh
	$ repo sync
	```
1. Fetch device specific sources

	7.1. Clone the local manifests with the following commands:
	
	```sh
	$ cd ~/android/system/
	$ git clone https://github.com/DerCoop/android_yt2.repo_local_manifests.git -b lineage-15.1 .repo/local_manifests
	```
	
	However if you already obtained local manifests from a different device, just copy at least the following files into .repo/local_manifests :
	
	- https://github.com/DerCoop/android_yt2.repo_local_manifests/blob/lineage-15.1/yt2.xml
	- https://github.com/DerCoop/android_yt2.repo_local_manifests/blob/lineage-15.1/common.xml
	
	8.2. Fetch device specific repos by synching all repos
		
	```sh
	$ repo sync
	```

1. Prepare the device-specific code

	This step is device specific and hence different from the "How to build".
	  
	```sh
	$ source build/envsetup.sh
	$ lunch lineage_YT2-userdebug
	```
	
	These commands only have a temporary effect, you will have to perform these commands again,   
    when you use a new terminal window.

	<!--1. (TODO optional) Turn on caching to speed up build (must be defined for the buildcontainer)
	
		Only if you want to rebuilt LineageOS multiple times you also should enable CCACHE.
		E.g. by adding the following lines to your $HOME/.bashrc:
		```
		export USE_CCACHE=1
		export ANDROID_CCACHE_DIR="/mnt/ccache" # Replace with your ccache dir
		export ANDROID_CCACHE_SIZE="50G" # Replace with your ccache size
		```
	-->
1. (optional) Setup the Java VM heap size for the Jack server:
	Java uses a default max. heap size of 1/4 of the installed RAM. Jack needs a minimum of 4 GB to work properly with Android N, so if your build environment has < 16 GB RAM you should add the following line to your $HOME/.bashrc:
	```
	export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"
	```

1. Start the build
	
	```sh
	$ croot
	$ brunch YT2
	```



# sidenotes

## build-packages

To build LineageOS, you’ll need:

    bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev

For Ubuntu versions older than 20.04 (focal), install also:

    libwxgtk3.0-dev

While for Ubuntu versions older than 16.04 (xenial), install:

    libwxgtk2.8-dev

Java

Different versions of LineageOS require different JDK (Java Development Kit) versions.

    LineageOS 18.1: OpenJDK 11 (included in source download)
    LineageOS 16.0-17.1: OpenJDK 1.9 (included in source download)
    LineageOS 14.1-15.1: OpenJDK 1.8 (install openjdk-8-jdk)
    LineageOS 11.0-13.0: OpenJDK 1.7 (install openjdk-7-jdk)*

* Ubuntu 16.04 and newer do not have OpenJDK 1.7 in the standard package repositories. See the Ask Ubuntu question “How do I install openjdk 7 on Ubuntu 16.04 or higher?”. Note that the suggestion to use PPA openjdk-r is outdated (the PPA has never updated their offering of openjdk-7-jdk, so it lacks security fixes); skip that answer even if it is the most upvoted.
Create the directories
* Ubuntu 14.04 and older do not have OpenJDK 1.8 and newer, add it with

	```sh
	apt-get install software-properties-common
	add-apt-repository ppa:openjdk-r/ppa
	apt update
	apt-get install openjdk-8-jdk
	```
* I figured out some problems with jack and java-8-jdk. With the version 8.0.282 it worked for me.

## add udev rules

https://web.archive.org/web/20160822100516/https://wiki.cyanogenmod.org/w/UDEV
https://web.archive.org/web/20160815205638/http://wiki.cyanogenmod.org/w/Adb

adb devices => use PTP modus (not MTP)
adb kill-servers => again

## use current files
=> extract files ()
cd device/*
./extract-files.sh

cd -
