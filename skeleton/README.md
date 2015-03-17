# My Test App

This is a skeleton of a Node.js server application (the example implements the echo server from Node.js homepage) that can be converted into a deb or a rpm package with [fpm](https://github.com/jordansissel/fpm/wiki). The skeleton was generated with the [luukere](https://www.npmjs.com/package/luukere) command.

If your application does not include compiled dependencies then you can build the package on any platform, eg. on OSX.

##

## Directory structure

Application sources can be found from [opt/app-name](opt/app-name). Upstart script executes [bin/app-name](opt/app-name/bin/app-name) executable which in turn loads the main application file [src/app-name.js](opt/app-name/src/app-name.js) – edit this file as you like, this is the starting point for your application. The aplication is run in respawn mode, so it is automatically restarted if the app exits.

Configuration folder can be found from [etc/app-name.d](etc/app-name.d), see [config module docs](https://github.com/lorenwest/node-config/wiki/Configuration-Files) for which files and in which order are loaded form this folder (yaml support is not included by default but you can use *.json* and *.js* files).

## Building the App

#### Dependencies

If you do not yet have [fpm](https://github.com/jordansissel/fpm) installed, install it like this:

    gem install fpm

If you generate packages in OSX you might need the gnu-tar package which can be installed with Homebrew:

    brew install gnu-tar

To build rpm packages in OSX you also need to install rpm support with Homebrew:

    brew install rpm

#### Build

Once you have the dependencies set up you're all good to go. Generate your application deb package with:

    ./build-deb.sh

or rpm package with:

    ./build-rpm.sh

These commands generate a deb or a rpm file to the */dist* folder. You can install the generated package on Ubuntu/Debian like this:

    dpkg -i app-name-1.0.0_amd64.deb

and on CentOS/RHEL like this:

    rpm -ivh app-name-1.0.0_amd64.rpm

> The package expects that Node.js is installed from a package (see instructions for Ubuntu [here](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)) and that the installed Node.js version is at least 0.10.

#### Uninstall package

If you want to remove the installed app from the server, you can do this in Debian/Ubuntu:

    apt-get remove app-name

or this in CentOS:

    yum remove app-name

Uninstalling removes all related files (excluding any files the app itself might have created outside its folder).

## License

[luukere](https://www.npmjs.com/package/luukere) command used to generate this application skeleton is licensed under the MIT license. The generated skeleton is licensed as public domain, so you can make it your own with no hassle.