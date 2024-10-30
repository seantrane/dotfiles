# @seantrane/dotfiles

> **Backup**, **restore**, and **sync** the prefs and settings for your toolbox. Your dotfiles might be the most important files on your machine.

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/) [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

## Table of Contents

- [About the dotfiles](#about)
- [Fork It _or Clone It_](forkit)
- [Install](#install)
- [Usage](#usage)
- [Thanks](#thanks)
- [Support](#support)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [License](#license)

---

## About the dotfiles <a id="about"></a>

These are _my_ dotfiles. The child of many influences, primarily [Zach Holman](https://github.com/holman)'s [dotfiles](https://github.com/holman/dotfiles), who I owe a great deal of credit to.

_See [Thanks section](#thanks) for full credits._

This is a highly organized and adaptive _dotfiles_ approach. Instead of using a limited set of bloated files, this approach is topic-centric and uses a folder-file structure to allow more effective customization, and diff-tracking.

These dotfiles are meant to support both MacOS and Linux at the same time. I use both regularly and prefer a consistent experience. However, most installs use [Homebrew](https://brew.sh) and will not work if Homebrew does not support the OS.

---

## Fork It _or Clone It_ <a id="forkit"></a>

Although one _could_ run the install instructions right from this repo, one _should_ fork or clone the repo into one's own Git provider, first. Then change all references below, from `github.com/seantrane/dotfiles` to `your.com/profile/repo`. Doing that will ensure all changes are committed to one's dotfiles repo.

---

## Install <a id="install"></a>

### Step 1

Extract the contents of the repository to `~/.dotfiles`. The command below will either use `git`, if available, or `curl` to clone the repo to that location.

```sh
if type "git" &> /dev/null; then git clone https://github.com/seantrane/dotfiles.git ~/.dotfiles; else cd; curl -LOk https://github.com/seantrane/dotfiles/archive/main.zip; unzip main.zip; mv dotfiles-main .dotfiles; rm main.zip; fi
```

### Step 2

Every file can be edited or removed as one pleases, but there are few primary files to focus on. Every file is heavily commented and should be intuitive to follow. Learn more about [file structure and processing, in contributing docs](https://github.com/seantrane/dotfiles/blob/main/CONTRIBUTING.md#file-structure).

> :eyes: **Note: Editing [Brewfile.symlink](system/Brewfile.symlink) file is a must.** Because it contains _my_ software preferences that others may not want. In fact, when I use my dotfiles between work and personal machines, this is the only file I really change.

1. [Edit `system/Brewfile.symlink`](system/Brewfile.symlink), for preferred software, resources, and anything else that can be installed using [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle#readme).
2. [Edit `macos/set-defaults.sh`](macos/set-defaults.sh), for [macOS defaults](https://macos-defaults.com), preferences.
3. [Edit `system/Gemfile.symlink`](system/Gemfile.symlink), for global Ruby gems.
4. [Edit `script/install`](script/install), for OS-specific installs, global Node.js/npm dependencies.
5. (Optional) [Edit `zsh/zpreztorc.symlink`](zsh/zpreztorc.symlink), for [Prezto](https://github.com/sorin-ionescu/prezto#readme) configuration.
6. (Optional) [Edit `zsh/zshenv.symlink`](zsh/zshenv.symlink) and [`zsh/zshrc.symlink`](zsh/zshrc.symlink), for [Zsh](https://zsh.sourceforge.io) configuration.
7. (Optional) [Edit `bash/bashrc.symlink`](bash/bashrc.symlink), for [Bash](https://zsh.sourceforge.io) configuration.

### Step 3

To bootstrap the `.dotfiles` and install dependencies, run the following command.

```sh
~/.dotfiles/script/bootstrap
```

This process will...

1. Configure the `.gitconfig` file.
2. Symlink all `~/.dotfiles/*/*.symlink` files to the `$HOME` directory.
3. Install _Xcode Command Line Tools_ (macOS only), if unavailable.
4. Install _Homebrew_, if unavailable.
5. Install _Git_, if not installed with _Homebrew_.
6. Install _Ruby_, if not installed with _Homebrew_.
7. Install _Prezto_, _Zsh_, and _Zsh Completions_.
8. Reset default shell to Zsh.

### Step 4

After restarting the terminal/shell, run all installers.

```sh
~/.dotfiles/script/install
```

### Step 5

Restart the terminal/shell.

### (Optional) Step 6

1. Attention [Oh My Zsh](https://ohmyz.sh) users. I prefer to use [Prezto](https://github.com/sorin-ionescu/prezto#readme) because it's faster and lightweight. Oh My Zsh can be easily swapped by editing the ["Source/init Prezto" section of `zsh/zshrc.symlink`](zsh/zshrc.symlink).
2. The Bash environment resembles the Zsh + Prezto environment as much as possible so that it's more seamless in moments when using Bash. Type `bash` at the Zsh-command-line to enter Bash shell, followed by `exit` when finished. If Bash is the preferred default, one can run `chsh -s "${HOMEBREW_PREFIX:-}/bin/bash"` or `chshell bash`, and update IDE preferences.

---

## Usage <a id="usage"></a>

### Topical

Everything is built around _topic_ areas. If you're adding a new area to your
forked _dotfiles_ — say, "Java" — you can simply add a `java` directory and put
files in there.

### Components

There are a few special files in the hierarchy.

- **`bin/*`**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.
- **`functions/*`**: Anything in `functions/` will be sourced, auto-loaded into the shell environment.
- **`<topic>/*.sh`**: Any files ending in `.sh` get loaded into Bash and Zsh.
- **`<topic>/*.bash`**: Any files ending in `.bash` get loaded into Bash.
- **`<topic>/*.zsh`**: Any files ending in `.zsh` get loaded into Zsh.
- **`<topic>/path.{,ba,z}sh`**: Any file named `path.sh`, `path.zsh` or `path.bash` is loaded first and is expected to setup `$PATH` or similar.
- **`<topic>/completion.{ba,z}sh`**: Any file named `completion.zsh` or `completion.bash` is loaded last and is expected to setup autocomplete.
- **`<topic>/*.symlink`**: Any files ending in `*.symlink` get symlinked into the `$HOME` directory (without extension), enabling version control and auto-loading at the same time. These get symlinked in when you run `script/bootstrap` or `install_dotfiles`.

### Updates/Maintenance

`dot` is a simple script that updates dependencies, packages, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in the `bin/` directory.

---

## System Provisioning Features <a id="features"></a>

### Node.js global dependencies

- [x] [`cucumber`](https://www.npmjs.com/package/cucumber)
- [ ] [`ember-cli`](https://www.npmjs.com/package/ember-cli)
- [ ] [`gulp`](https://www.npmjs.com/package/gulp)
- [x] [`less`](https://www.npmjs.com/package/less)
- [x] [`serverless`](https://www.npmjs.com/package/serverless)
- [x] [`yo`](https://www.npmjs.com/package/yo)

### Ruby Gems

- [x] [`boom`](https://github.com/holman/boom)
- [x] [`jekyll`](https://jekyllrb.com)
- [x] [`rails`](https://rubyonrails.org)
- [x] [`sass`](https://sass-lang.com/)

### Visual Studio Code Extensions

_Some extensions may be disabled (commented-out in code)._

- [x] [Angular Snippets](https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2)
- [x] [Apache Conf](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-apache)
- [x] [AsciiDoc support](https://marketplace.visualstudio.com/items?itemName=asciidoctor.asciidoctor-vscode)
- [x] [Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings)
- [x] [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
- [x] [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [x] [AutoFileName](https://marketplace.visualstudio.com/items?itemName=JerryHong.autofilename)
- [x] [autopep8 Python formatter](https://marketplace.visualstudio.com/items?itemName=ms-python.autopep8)
- [x] [BalanceD Syntax Theme](https://marketplace.visualstudio.com/items?itemName=seantrane.balanced-theme)
- [x] [BATS (Bash Automated Testing System)](https://marketplace.visualstudio.com/items?itemName=jetmartin.bats)
- [x] [Bash IDE](https://marketplace.visualstudio.com/items?itemName=mads-hartmann.bash-ide-vscode)
- [x] [Better Align](https://marketplace.visualstudio.com/items?itemName=chouzz.vscode-better-align)
- [x] [Black Formatter for Python](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter)
- [x] [Bootstrap 4, Font awesome 4, Font Awesome 5 Free & Pro snippets](https://marketplace.visualstudio.com/items?itemName=thekalinga.bootstrap4-vscode)
- [x] [Brewfile](https://marketplace.visualstudio.com/items?itemName=sharat.vscode-brewfile)
- [x] [Bridge to Kubernetes](https://marketplace.visualstudio.com/items?itemName=mindaro.mindaro)
- [x] [Change Case](https://marketplace.visualstudio.com/items?itemName=wmaurer.change-case)
- [x] [chmod](https://marketplace.visualstudio.com/items?itemName=dlech.chmod)
- [x] [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
- [x] [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [x] [Contextual Duplicate](https://marketplace.visualstudio.com/items?itemName=lafe.contextualduplicate)
- [x] [Cucumber (Gherkin) Syntax and Snippets](https://marketplace.visualstudio.com/items?itemName=stevejpurves.cucumber)
- [x] [Cuelang](https://marketplace.visualstudio.com/items?itemName=nickgo.cuelang)
- [x] [Debugger for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug)
- [x] [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [x] [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [x] [Document This](https://marketplace.visualstudio.com/items?itemName=oouo-diogo-perdigao.docthis)
- [x] [DotENV](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
- [x] [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [x] [Elixir Support for VS Code](https://marketplace.visualstudio.com/items?itemName=mjmcloug.vscode-elixir)
- [x] [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [x] [ExpressionEngine](https://marketplace.visualstudio.com/items?itemName=jrrdnx.expressionengine)
- [x] [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)
- [x] [File Downloader](https://marketplace.visualstudio.com/items?itemName=mindaro-dev.file-downloader)
- [x] [File Utils](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)
- [x] [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
- [x] [GitHub Codespaces](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces)
- [x] [gitignore](https://marketplace.visualstudio.com/items?itemName=codezombiech.gitignore)
- [x] [Go](https://marketplace.visualstudio.com/items?itemName=golang.go)
- [x] [Gradle for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-gradle)
- [x] [GraphQL for VSCode](https://marketplace.visualstudio.com/items?itemName=kumar-harsh.graphql-for-vscode)
- [x] [HashiCorp Terraform](https://marketplace.visualstudio.com/items?itemName=hashicorp.terraform)
- [x] [i18n Ally](https://marketplace.visualstudio.com/items?itemName=lokalise.i18n-ally)
- [x] [IntelliCode API Usage Examples](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.intellicode-api-usage-examples)
- [x] [IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [x] [isort](https://marketplace.visualstudio.com/items?itemName=ms-python.isort)
- [x] [Jasmine code snippets](https://marketplace.visualstudio.com/items?itemName=xabikos.JasmineSnippets)
- [x] [JavaScript (ES6) code snippets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets)
- [x] [JavaScript Snippet Pack](https://marketplace.visualstudio.com/items?itemName=akamud.vscode-javascript-snippet-pack)
- [x] [Jekyll Syntax Support](https://marketplace.visualstudio.com/items?itemName=ginfuru.ginfuru-vscode-jekyll-syntax)
- [x] [Jest](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest)
- [x] [Kubernetes](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
- [x] [Language Support for Java(TM) by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.java)
- [x] [Lodash Snippets](https://marketplace.visualstudio.com/items?itemName=tomphilbin.lodash-snippets)
- [x] [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [x] [Markdown Preview Github Styling](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles)
- [x] [Markdown Table Prettifier](https://marketplace.visualstudio.com/items?itemName=darkriszty.markdown-table-prettify)
- [x] [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [x] [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- [x] [Maven for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven)
- [x] [Mocha Snippets](https://marketplace.visualstudio.com/items?itemName=Alan.MochaSnippets)
- [x] [Multiple Formatters](https://marketplace.visualstudio.com/items?itemName=Jota0222.multi-formatter)
- [x] [New Relic CodeStream](https://marketplace.visualstudio.com/items?itemName=CodeStream.codestream)
- [x] [New Relic One](https://marketplace.visualstudio.com/items?itemName=new-relic.nr1)
- [x] [New Relic Query Language](https://marketplace.visualstudio.com/items?itemName=joelalejandro.nrql-language)
- [x] [npm Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense)
- [x] [Output Colorizer](https://marketplace.visualstudio.com/items?itemName=IBM.output-colorizer)
- [x] [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [x] [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [x] [Project Manager for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-dependency)
- [x] [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [x] [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [x] [Python Debugger](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy)
- [x] [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)
- [x] [RAML](https://marketplace.visualstudio.com/items?itemName=jeppeandersen.raml)
- [x] [React Native Tools](https://marketplace.visualstudio.com/items?itemName=msjsdiag.vscode-react-native)
- [x] [Regex Previewer](https://marketplace.visualstudio.com/items?itemName=chrmarti.regex)
- [x] [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)
- [x] [Rewrap](https://marketplace.visualstudio.com/items?itemName=stkb.rewrap)
- [x] [Sass (.sass only)](https://marketplace.visualstudio.com/items?itemName=Syler.sass-indented)
- [x] [Select Line Status Bar](https://marketplace.visualstudio.com/items?itemName=tomoki1207.selectline-statusbar)
- [x] [Shell Snippets](https://marketplace.visualstudio.com/items?itemName=DeepInThought.vscode-shell-snippets)
- [x] [ShellCheck](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck)
- [x] [shfmt](https://marketplace.visualstudio.com/items?itemName=mkhl.shfmt)
- [x] [slugify](https://marketplace.visualstudio.com/items?itemName=maximerouiller.slugify-vscode)
- [x] [SonarLint](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarlint-vscode)
- [x] [Sort JSON objects](https://marketplace.visualstudio.com/items?itemName=richie5um2.vscode-sort-json)
- [x] [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
- [x] [Terraform doc snippets](https://marketplace.visualstudio.com/items?itemName=run-at-scale.terraform-doc-snippets)
- [x] [Test Runner for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-test)
- [x] [Vetur - Vue tooling for VS Code](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
- [x] [VS Code database](https://marketplace.visualstudio.com/items?itemName=bajdzis.vscode-database)
- [x] [VS DocBlockr](https://marketplace.visualstudio.com/items?itemName=jeremyljackson.vs-docblock)
- [x] [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [x] [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml)
- [x] [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [x] [yapf Python formatter](https://marketplace.visualstudio.com/items?itemName=eeyore.yapf)
- [x] [yo](https://marketplace.visualstudio.com/items?itemName=samverschueren.yo)

---

## Thanks <a id="thanks"></a>

Big thanks goes out to [Zach Holman](https://github.com/holman), whose [dotfiles](https://github.com/holman/dotfiles) were so awesome, I had to fork them. Zach forked his from [Ryan Bates](https://github.com/ryanb)' [dotfiles](https://github.com/ryanb/dotfiles). I am grateful for their efforts. Zach wrote [a post on the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) that I encourage reading.

I've also learned and depend on techniques from other dotfiles; [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Paul Irish](https://github.com/paulirish/dotfiles), and [Simon Owen](https://github.com/s10wen/dotfiles) who also wrote a [great article](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449) on the subject.

[Learn more about dotfiles](https://dotfiles.github.io).

---

## Support <a id="support"></a>

[Submit an issue](https://github.com/seantrane/dotfiles/issues/new), in which you should provide as much detail as necessary for your issue.

### Bugs

I don't really promote this repository, it's just for my personal use and made available for everyone.
If you experience any bugs, I'm definitely interested, but cannot promise anything.

## Contributing <a id="contributing"></a>

Contributions are always appreciated. Read [CONTRIBUTING.md](https://github.com/seantrane/dotfiles/blob/main/CONTRIBUTING.md) documentation to learn more.

## Changelog <a id="changelog"></a>

Release details are documented in the [CHANGELOG.md](https://github.com/seantrane/dotfiles/blob/main/CHANGELOG.md) file, and on the [GitHub Releases page](https://github.com/seantrane/dotfiles/releases).

---

## License <a id="license"></a>

[ISC License](https://github.com/seantrane/finda/blob/main/LICENSE)

Copyright (c) 2015 [Sean Trane Sciarrone](https://github.com/seantrane)
