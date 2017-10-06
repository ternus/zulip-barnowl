# Easy setup for command-line Zulip with Barnowl

[Adam Glasgall](https://github.com/aglasgall)'s beta [Zulip support for Barnowl](https://github.com/aglasgall/barnowl/tree/zulip/perl/modules/Zulip) is great, but requires compiling Barnowl from source. This isn't the easiest thing in the world, especially if you're on OS X.

Maybe you just want to get a command-line interface to Zulip! That's where this Vagrant setup comes in.

## Prerequisites

1. [Download and install Vagrant](https://www.vagrantup.com/downloads.html).
2. If necessary, download and install a provider such as [Virtualbox](https://www.virtualbox.org/wiki/Downloads).
3. Check out this repository, and in your checkout's directory, run `vagrant up`.
4. Follow the prompts. Make sure to have your Zulip username, realm, and API key on hand.
5. Once the Vagrant VM has started, run `vagrant ssh` and, inside the machine, `./zulip-barnowl`.

That's it! 

## TODOs

* "How to use Barnowl for Zulip users" README
* Better default setup with more aliases
* Automatic color configuration