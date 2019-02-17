# @seantrane/dotfiles

> **Backup**, **restore**, and **sync** the prefs and settings for your toolbox. Your dotfiles might be the most important files on your machine.

[![Build Status](https://travis-ci.com/seantrane/dotfiles.svg?branch=master)](https://travis-ci.com/seantrane/dotfiles) [![devDependencies Status](https://david-dm.org/seantrane/dotfiles/dev-status.svg)](https://david-dm.org/seantrane/dotfiles?type=dev) [![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/) [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

## Table of Contents

- [About the dotfiles](#about)
- [Install](#install)
- [Usage](#usage)
- [Thanks](#thanks)
- [Support](#support)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [License](#license)

---

## About the dotfiles <a id="about"></a>

These are my dotfiles, the child of many influences, primarily
[Zach Holmans](https://github.com/holman)' [dotfiles](https://github.com/holman/dotfiles), who I owe a great deal of credit to.

See [Thanks section](#thanks) for full credits.

This is a highly organized and adaptive _dotfiles_ approach. Instead of using a limited set of bloated files, this approach is topic-centric and uses a folder-file structure to allow more effective customization, and diff-tracking.

## Install <a id="install"></a>

### Step 1

Extract the contents of this repository to `~/.dotfiles`.

1(a). If you are starting from a fresh OS install, without Git, run this:

```sh
cd; curl -LOk https://github.com/seantrane/dotfiles/archive/master.zip; unzip master.zip; mv dotfiles-master .dotfiles; rm master.zip;
```

1(b). If you have Git installed, run this instead:

```sh
git clone https://github.com/seantrane/dotfiles.git ~/.dotfiles
```

### Step 2

Every file can be edited or removed as you please, but there are few primary files you'll want to focus on.

Edit the `zsh/zpreztorc.symlink`, for Prezto configuration.

Edit the `zsh/zshenv.symlink`, for Zsh configuration.

Edit the `osx/set-defaults.sh`, for your OS X preferences.

Edit the `osx/install-casks.sh`, for your preferred OS X apps.

Edit the `php/install.sh`, to modify PHP/extensions.

### Step 3

Bootstrap the `.dotfiles` and install dependencies.

```sh
~/.dotfiles/script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

It will then install common dependencies, in the proper order.

This will also install Zsh and Prezto and will reset your default shell.

### Step 4

After restarting your terminal/shell, run all installers.

```sh
~/.dotfiles/script/install
```

This will not only install all of your [components](#components),
but it will also install your chosen apps/casks in `osx/install-casks.sh`.

### Step 5

Restart your terminal/shell.

## Usage <a id="usage"></a>

### Topical

Everything is built around topic areas. If you're adding a new area to your
forked _dotfiles_ — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

### Components

There are a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

### Updates/Maintenance

`dot` is a simple script that updates dependencies, packages, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

---

## Thanks <a id="thanks"></a>

Big thanks goes out to [Zach Holman](https://github.com/holman), whose [dotfiles](https://github.com/holman/dotfiles)  were so awesome, I had to fork them. Zach forked his from [Ryan Bates](https://github.com/ryanb)' [dotfiles](https://github.com/ryanb/dotfiles).  I am grateful for their efforts. Zach wrote [a post on the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)  that I encourage reading.

I've also learned and depend on techniques from other dotfiles; [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Paul Irish](https://github.com/paulirish/dotfiles), and [Simon Owen](https://github.com/s10wen/dotfiles) who also wrote a [great article](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449) on the subject.

[Learn more about dotfiles](https://dotfiles.github.io).

---

## Support <a id="support"></a>

[Submit an issue](https://github.com/seantrane/dotfiles/issues/new), in which you should provide as much detail as necessary for your issue.

### Bugs

I don't really promote this repository, it's just for my personal use and made available for everyone.
If you experience any bugs, I'm definitely interested, but cannot promise anything.

## Contributing <a id="contributing"></a>

Contributions are always appreciated. Read [CONTRIBUTING.md](https://github.com/seantrane/dotfiles/blob/master/CONTRIBUTING.md) documentation to learn more.

## Changelog <a id="changelog"></a>

Release details are documented in the [CHANGELOG.md](https://github.com/seantrane/dotfiles/blob/master/CHANGELOG.md) file, and on the [GitHub Releases page](https://github.com/seantrane/dotfiles/releases).

---

## License <a id="license"></a>

[ISC License](https://github.com/seantrane/finda/blob/master/LICENSE)

Copyright (c) 2015 [Sean Trane Sciarrone](https://github.com/seantrane)
