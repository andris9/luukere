# luukere

Generate Node.js server application skeletons that can be compiled into Debian/Ubuntu deb and CentOS rpm packages.

The skeleton is an application with required components to run it as a server daemon. It already includes a respawning upstart script, configuration folder under /etc, logging to /var/log and so on. You can build your server app and compile it to a Debian/Ubuntu or CentOS package with the included build scripts and not worry about directory strucutres in the server.

### What is included in the skeleton?

  * Application code at */opt/app-name*
  * Respawning upstart script at */etc/init* (daemon is restarted if it is closed unexpectedly)
  * Configuration folder at */etc/app-name.d*
  * Log file at */var/log/app-name.log*
  * PID file at */var/run/app-name.pid*

The example application uses [config](http://npmjs.org/package/config) module for configuration (auto-loads configuration from the config folder) and [npmlog](http://npmjs.org/package/npmlog) for logging but you do not have to use these.

### What is "luukere"?

*Luukere* is *skeleton* in Estonian

## Install

Install from npm

    npm install -g luukere

## Usage

### Generate Skeleton App

    luukere -a "app-name" -d "My Awesome Server App"

Where

  * **-a** identifies the app name (this is used as a folder name, so don't use spaces etc.)
  * **-d** describes the created app

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

    cd app-name
    ./build-deb.sh

or rpm package with:

    cd app-name
    ./build-rpm.sh

Thes commands generate deb and rpm files to the */dist* folder. You can install the generated package on Ubuntu/Debian like this:

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

[luukere](https://www.npmjs.com/package/luukere) is licensed under the MIT license. The generated skeleton is licensed as public domain, so you can make it your own with no hassle.