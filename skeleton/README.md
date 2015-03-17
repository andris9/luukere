# Node DEB Skeleton

This is a skeleton of a Node.js server application (the example implements the echo server from Node.js homepage) that can be converted into a deb package with [fpm](https://github.com/jordansissel/fpm/wiki). The skeleton was generated with the [luukere](https://www.npmjs.com/package/luukere) command.

If your application does not include compiled dependencies then you can build the package on any platform, eg. on OSX.

##

## Directory structure

Application sources can be found from [opt/my-test-app](opt/my-test-app). Upstart script executes [bin/my-test-app](opt/my-test-app/bin/my-test-app) executable which in turn loads the main application file [src/my-test-app.js](opt/my-test-app/src/my-test-app.js) – edit this file as you like, this is the starting point for your application. The aplication is run in respawn mode, so it is automatically restarted if the app exits.

Configuration folder can be found from [etc/my-test-app.d](etc/my-test-app.d), see [config module docs](https://github.com/lorenwest/node-config/wiki/Configuration-Files) for which files and in which order are loaded form this folder (yaml support is not included by default but you can use *.json* and *.js* files).

## Building the App

#### Dependencies

If you do not yet have [fpm](https://github.com/jordansissel/fpm) installed, install it like this:

    gem install fpm

If you generate packages in OSX you might need the gnu-tar package which can be installed with Homebrew:

    brew install gnu-tar

#### Build

Once you have the dependencies set up you're all good to go. Generate your application package with:

    ./build-deb-sh

The command generates a deb file to the */dist* folder. You can install the generated package on Ubuntu/Debian like this:

    dpkg -i my-test-app-1.0.0_amd64.deb

> The package expects that Node.js is installed from a package (see instructions for Ubuntu [here](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)) and that the installed Node.js version is at least 0.10.

## License

[luukere](https://www.npmjs.com/package/luukere) command used to generate this application skeleton is licensed under the MIT license. The generated skeleton is licensed as public domain, so you can make it your own with no hassle.