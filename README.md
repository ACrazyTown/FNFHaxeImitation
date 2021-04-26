# Friday Night Funkin' Haxe Imitation

A small Haxe/HaxeFlixel project where I try to remake the FNF Ludum Dare title screen... and get sidetracked...

I wanted to learn Haxe/HaxeFlixel more, so I decided to do this as practice sort of with limited access to the original FNF source code.
Also I know the repo name is weird I just had no other ideas what to name it.

## Play
If you want to play this (for some reason...), the only way for you to play it is to either 
- Play the HTML5 version on this repo's [Github Pages]()
or
- Build it yourself.
  - Building it yourself is harder, depending on if you wish to build it for HTML5 or Windows/Mac/Linux.
  - For more detailed instructions, scroll down to the Build Instructions.

## Credits
**Programming** by **[A Crazy Town (me! :\])](https://twitter.com/acrazytown)**

**Art** by **[evilsk8r](https://twitter.com/evilsk8r)**
**Animation** by **[Phantom Arcade](https://twitter.com/PhantomArcade3K)**
**Music** by **[kawaisprite](https://twitter.com/kawaisprite)**
**OG Game** by **[ninjamuffin99](https://twitter.com/ninja_muffin99)**

## Building the game
In order to build the game, you need to download and install Haxe/HaxeFlixel. This is fairly easy.

1. Download & Install [Haxe 4.1.5](https://haxe.org/download/version/4.1.5/) (do not download Haxe 4.2.0 as apparently it is buggy but I have not tested it out.)
2. Download & Install [HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/)

After doing this, you need to install some addons. An up-to-date list will be in the `Project.xml` file however currently the game relies only on the flixel-addons so you can install them by running ```haxelib run flixel setup```.

### HTML5
To build the game for HTML5 is fairly simple.
- If you just want to run the game locally, type `lime test html5 -debug` in a command interface in the root of the Project.
- If you want to build the game, type `lime build html5 -final`.

### Linux
Open a terminal in the project's directory and type `lime test linux -debug` then run the executable file located in `export/release/linux/bin`.

## Windows
To build it on Windows, you need to install Visual Studio Community 2019, go to the components tab, and select the following:
```
MSVC v142 - VS 2019 C++ x64/x86 build tools
```
After that installs, build it by running `lime test windows -debug` or `lime build windows`

## Mac
coming soon....
