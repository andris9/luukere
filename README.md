# luukere

Generate Node.js server application skeletons that can be compiled into Debian/Ubuntu .deb packages. The skeleton is a server application (the echo server example from Node.js homepage is used as the skeleton server) with required components to run it as a server daemon. The skeleton includes a respawning upstart script, configuration folder under /etc, logging to /var/log and so on. You can build your server app and compile it to a Debian/ubuntu package and not worry about directory strucutres in the server.

## Install

Install from npm

    npm install -g luukere

## Usage

### Generate Skeleton App

    luukere -a "my-test-app" -d "My Awesome Server App"

Where

  * **-a** identifies the app name (this is used as a folder name, so don't use spaces etc.)
  * **-d** describes the created app

## Building the App

#### Dependencies

If you do not yet have [fpm](https://github.com/jordansissel/fpm) installed, install it like this:

    gem install fpm

If you generate packages in OSX you might need the gnu-tar package which can be installed with Homebrew:

    brew install gnu-tar

#### Build

Once you have the dependencies set up you're all good to go. Generate your application package with:

    cd my-test-app
    ./build-deb-sh

The command generates a deb file to the */dist* folder. You can install the generated package on Ubuntu/Debian like this:

    dpkg -i my-test-app-1.0.0_amd64.deb

> The package expects that Node.js is installed from a package (see instructions for Ubuntu [here](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)) and that the installed Node.js version is at least 0.10.

## License

[luukere](https://www.npmjs.com/package/luukere) is licensed under the MIT license. The generated skeleton is licensed as public domain, so you can make it your own with no hassle.