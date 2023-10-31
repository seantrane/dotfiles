# @seantrane/dotfiles

> **Backup**, **restore**, and **sync** the prefs and settings for your toolbox. Your dotfiles might be the most important files on your machine.

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/) [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

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

These are my dotfiles, the child of many influences, primarily [Zach Holman](https://github.com/holman)'s [dotfiles](https://github.com/holman/dotfiles), who I owe a great deal of credit to.

See [Thanks section](#thanks) for full credits.

This is a highly organized and adaptive _dotfiles_ approach. Instead of using a limited set of bloated files, this approach is topic-centric and uses a folder-file structure to allow more effective customization, and diff-tracking.

## Install <a id="install"></a>

### Step 1

Extract the contents of this repository to `~/.dotfiles`.

1(a). If you are starting from a fresh OS install, without Git, run this:

```sh
cd; curl -LOk https://github.com/seantrane/dotfiles/archive/main.zip; unzip main.zip; mv dotfiles-main .dotfiles; rm main.zip;
```

1(b). If you have Git installed, run this instead:

```sh
git clone https://github.com/seantrane/dotfiles.git ~/.dotfiles
```

### Step 2

Every file can be edited or removed as you please, but there are few primary files you'll want to focus on.

Edit the `zsh/zpreztorc.symlink`, for Prezto configuration.

Edit the `zsh/zshenv.symlink`, for Zsh configuration.

Edit the `macos/set-defaults.sh`, for your OS X preferences.

Edit the `macos/install-casks.sh`, for your preferred OS X apps.

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
but it will also install your chosen apps/casks in `macos/install-casks.sh`.

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
- [x] [`sass`](https://sass-lang.com/)

### Visual Studio Code Extensions

_Some extensions are disabled (commented-out in code)._

- [x] [Angular Snippets](https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2)
- [x] [Apache Conf](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-apache)
- [x] [Atom Keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.atom-keybindings)
- [x] [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
- [x] [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [x] [AutoFileName](https://marketplace.visualstudio.com/items?itemName=JerryHong.autofilename)
- [x] [Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account)
- [x] [BalanceD Syntax Theme](https://marketplace.visualstudio.com/items?itemName=seantrane.balanced-theme)
- [x] [BATS (Bash Automated Testing System)](https://marketplace.visualstudio.com/items?itemName=jetmartin.bats)
- [x] [Better Align](https://marketplace.visualstudio.com/items?itemName=chouzz.vscode-better-align)
- [x] [Bootstrap 4, Font awesome 4, Font Awesome 5 Free & Pro snippets](https://marketplace.visualstudio.com/items?itemName=thekalinga.bootstrap4-vscode)
- [ ] [Bridge to Kubernetes](https://marketplace.visualstudio.com/items?itemName=mindaro.mindaro)
- [x] [Change Case](https://marketplace.visualstudio.com/items?itemName=wmaurer.change-case)
- [x] [chmod](https://marketplace.visualstudio.com/items?itemName=dlech.chmod)
- [x] [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
- [x] [Contextual Duplicate](https://marketplace.visualstudio.com/items?itemName=lafe.contextualduplicate)
- [x] [Debugger for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug)
- [x] [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [x] [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [x] [Document This](https://marketplace.visualstudio.com/items?itemName=oouo-diogo-perdigao.docthis)
- [x] [DotENV](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
- [x] [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [x] [Elixir Support for VS Code](https://marketplace.visualstudio.com/items?itemName=mjmcloug.vscode-elixir)
- [ ] [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [x] [ExpressionEngine](https://marketplace.visualstudio.com/items?itemName=jrrdnx.expressionengine)
- [x] [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)
- [x] [File Downloader](https://marketplace.visualstudio.com/items?itemName=mindaro-dev.file-downloader)
- [x] [File Utils](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)
- [x] [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
- [x] [GitHub Codespaces](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces)
- [x] [gitignore](https://marketplace.visualstudio.com/items?itemName=codezombiech.gitignore)
- [ ] [Go](https://marketplace.visualstudio.com/items?itemName=golang.go)
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
- [ ] [Kubernetes](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
- [x] [Language Support for Java(TM) by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.java)
- [x] [Lodash Snippets](https://marketplace.visualstudio.com/items?itemName=tomphilbin.lodash-snippets)
- [x] [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [x] [Markdown Preview Github Styling](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles)
- [x] [Markdown Table Prettifier](https://marketplace.visualstudio.com/items?itemName=darkriszty.markdown-table-prettify)
- [x] [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [x] [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- [x] [Maven for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven)
- [x] [Mocha Snippets](https://marketplace.visualstudio.com/items?itemName=Alan.MochaSnippets)
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
- [x] [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)
- [x] [RAML](https://marketplace.visualstudio.com/items?itemName=jeppeandersen.raml)
- [x] [React Native Tools](https://marketplace.visualstudio.com/items?itemName=msjsdiag.vscode-react-native)
- [x] [Regex Previewer](https://marketplace.visualstudio.com/items?itemName=chrmarti.regex)
- [x] [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)
- [x] [Rewrap](https://marketplace.visualstudio.com/items?itemName=stkb.rewrap)
- [x] [Ruby LSP](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp)
- [x] [Sass (.sass only)](https://marketplace.visualstudio.com/items?itemName=Syler.sass-indented)
- [x] [Select Line Status Bar](https://marketplace.visualstudio.com/items?itemName=tomoki1207.selectline-statusbar)
- [x] [Shell Snippets](https://marketplace.visualstudio.com/items?itemName=DeepInThought.vscode-shell-snippets)
- [x] [ShellCheck](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck)
- [x] [slugify](https://marketplace.visualstudio.com/items?itemName=maximerouiller.slugify-vscode)
- [x] [Snippets and Syntax Highlight for Gherkin (Cucumber)](https://marketplace.visualstudio.com/items?itemName=stevejpurves.cucumber)
- [x] [SonarLint](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarlint-vscode)
- [x] [Sort JSON objects](https://marketplace.visualstudio.com/items?itemName=richie5um2.vscode-sort-json)
- [x] [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
- [x] [Terraform doc snippets](https://marketplace.visualstudio.com/items?itemName=run-at-scale.terraform-doc-snippets)
- [x] [Test Runner for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-test)
- [x] [Vetur - Vue tooling for VS Code](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
- [x] [VS Code database](https://marketplace.visualstudio.com/items?itemName=bajdzis.vscode-database)
- [x] [VS DocBlockr](https://marketplace.visualstudio.com/items?itemName=jeremyljackson.vs-docblock)
- [x] [VSCode Ruby](https://marketplace.visualstudio.com/items?itemName=wingrunr21.vscode-ruby)
- [x] [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [x] [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml)
- [x] [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [x] [yo](https://marketplace.visualstudio.com/items?itemName=samverschueren.yo)

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

Contributions are always appreciated. Read [CONTRIBUTING.md](https://github.com/seantrane/dotfiles/blob/main/CONTRIBUTING.md) documentation to learn more.

## Changelog <a id="changelog"></a>

Release details are documented in the [CHANGELOG.md](https://github.com/seantrane/dotfiles/blob/main/CHANGELOG.md) file, and on the [GitHub Releases page](https://github.com/seantrane/dotfiles/releases).

---

## License <a id="license"></a>

[ISC License](https://github.com/seantrane/finda/blob/main/LICENSE)

Copyright (c) 2015 [Sean Trane Sciarrone](https://github.com/seantrane)
