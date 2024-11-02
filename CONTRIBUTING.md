# Contributing

> Thank you for contributing. Contributions are always welcome, no matter how large or small.

## Table of Contents

- [Guidelines](#guidelines)
- [Pull Requests](#submitting-a-pull-request)
- [Coding Rules](#coding-rules)
- [Working with Code](#working-with-code)
- [File Structure](#file-structure)

---

## Guidelines <a id="guidelines"></a>

As a contributor, here are the guidelines you should follow:

- [Code of conduct](#code-of-conduct)
- [How can I contribute?](#how-can-i-contribute)
- [Using the issue tracker](#using-the-issue-tracker)
- [Submitting a Pull Request](#submitting-a-pull-request)
- [Coding rules](#coding-rules)
- [Working with code](#working-with-code)

We also recommend to read [How to Contribute to Open Source](https://opensource.guide/how-to-contribute).

---

## Code of conduct <a id="code-of-conduct"></a>

Please read and follow our [code of conduct](CODE_OF_CONDUCT.md).

---

## How can I contribute? <a id="how-can-i-contribute"></a>

### Improve documentation <a id="improve-documentation"></a>

Consider helping us to improve our documentation by finding _documentation issues_ that need help, and by submitting pull requests for corrections, clarifications, more examples, new features, etc.

Please follow the [Documentation guidelines](STYLE_GUIDES.md#documentation).

### Give feedback on issues <a id=""></a>

Some issues are created without information requested in the [Bug report guideline](#bug-report). Help making them easier to resolve by adding any relevant information.

Issues with the [`type: discussion` label](https://github.com/seantrane/dotfiles/labels/type%3A%20discussion) are meant to discuss the implementation of new features. Participating in the discussion is a good opportunity to get involved and influence the future.

### Fix bugs and implement features <a id=""></a>

Confirmed [bug](https://github.com/seantrane/dotfiles/labels/type%3A%20bug) and ready to implement [features](https://github.com/seantrane/dotfiles/labels/type%3A%20feature) are marked with the [`help` label](https://github.com/seantrane/dotfiles/labels/help). Post a comment on an issue to indicate you would like to work on it, and to request help from the maintainer(s) and the community.

---

## Using the issue tracker <a id="using-the-issue-tracker"></a>

The issue tracker is the channel for [bug reports](#bug-report), [features requests](#feature-request) and [submitting pull requests](#submitting-a-pull-request) only. Please use the [Support](README.md#support) and [Get help](README.md#get-help) sections for support, troubleshooting and questions.

Before opening an Issue or a Pull Request, please use the [GitHub issue search](https://github.com/seantrane/dotfiles/issues) to make the bug or feature request hasn't been already reported or fixed.

### Bug report <a id="bug-report"></a>

[A good bug report](https://github.com/seantrane/dotfiles/issues/new?assignees=&labels=bug%2Ctriage&projects=&template=bug_report.yml&title=%5BBug%5D%3A+) shouldn't leave others needing to chase you up for more information. Please try to be as detailed as possible in your report and fill the information requested in the _[Bug Report](https://github.com/seantrane/dotfiles/issues/new?assignees=&labels=bug%2Ctriage&projects=&template=bug_report.yml&title=%5BBug%5D%3A+)_.

### Feature request <a id="feature-request"></a>

[Feature requests are welcome](https://github.com/seantrane/dotfiles/issues/new/choose). But take a moment to find out whether your idea fits with the scope and aims of the project. It's up to you to make a strong case to convince the project's developers of the merits of this feature. Please provide as much detail and context as possible and fill the information requested in the _[Agile User Story form/template](https://github.com/seantrane/dotfiles/issues/new?assignees=&labels=state%3A+pending%2Ctype%3A+discussion&projects=&template=agile_user_story.yml&title=%5BStory%5D%3A+As+a+%7Bpersona%7D%2C+I+want+%7Bsomething%7D%2C+so+that+%7Boutcome%7D.)_.

---

## Submitting a Pull Request <a id="submitting-a-pull-request"></a>

Good pull requests whether patches, improvements or new features are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

**Please ask first** before embarking on any significant pull request (e.g. implementing features, refactoring code), otherwise you risk spending a lot of time working on something that the project's developers might not want to merge into the project.

If you never created a pull request before, then [learn how to submit a pull request (great tutorial)](https://opensource.guide/how-to-contribute/#opening-a-pull-request).

Here is a summary of the steps to follow:

1. [Set up the workspace](#set-up-the-workspace)
2. If you cloned a while ago, get the latest changes from upstream and update dependencies.
3. Create a new topic branch (off the main project development branch) to contain your feature, change, or fix; `git checkout -b <topic-branch-name>`
4. Make your code changes, following the [Coding rules](#coding-rules)
5. Push your topic branch up to your fork; `git push origin <topic-branch-name>`
6. [Open a Pull Request](https://help.github.com/articles/creating-a-pull-request/#creating-the-pull-request) with a clear title and description.

**Tips**:

- Create your branch from `main`.
- Ensure your [git commit messages follow the required format](STYLE_GUIDES.md#git-commit-messages).
- Ensure your scripts are well-formed, well-documented and object-oriented.
- Ensure your scripts are stateless and can be reused by all.
- Update your branch, and resolve any conflicts, before making pull request.
- Fill in [the required template](.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).
- Do not include issue numbers in the PR title.
- Include screenshots and animated GIFs in your pull request whenever possible.
- Follow the [style guide](STYLE_GUIDES.md) [applicable to the language](STYLE_GUIDES.md#languages) or task.
- Include thoughtfully-worded, well-structured tests/specs. See the [Tests/Specs Style Guide](STYLE_GUIDES.md#tests).
- Document new code based on the [Documentation Style Guide](STYLE_GUIDES.md#documentation).
- End all files with a newline.

---

## Coding rules <a id="coding-rules"></a>

- [Commit message guidelines](STYLE_GUIDES.md#git-commit-messages)
- [Documentation](STYLE_GUIDES.md#documentation)
- [Lint](STYLE_GUIDES.md#lint)
- [Source Code](STYLE_GUIDES.md#source-code)
- [Tests/Specs](STYLE_GUIDES.md#tests)

---

## Working with code <a id="working-with-code"></a>

- [Configure SSH authentication](#configure-ssh)
- [Set up the workspace](#set-up-the-workspace)
- [Running tests](#running-tests)

### Configure SSH authentication for _containerized workspace_ <a id="configure-ssh"></a>

The following steps enable the _containerized workspace_ to authenticate when retrieving private repositories from GitHub. This also ensures a universal experience for all contributors, without disrupting anyone's existing keys.

_If you've already created a "shared RSA key", you can skip this section._

1. Generate an RSA key:

   ```sh
   ssh-keygen -t rsa -b 4096 -C "{username}@users.noreply.github.com"
   ```

2. When prompted, provide file path `~/.ssh/id_rsa_shared`.

   ```text
   Enter file in which to save the key (~/.ssh/id_rsa): ~/.ssh/id_rsa_shared
   ```

3. **Do not** set a passphrase, just click enter twice.

   ```text
   Enter passphrase (empty for no passphrase):
   Enter same passphrase again:
   ```

4. This will create 2 files, a private-key and its public-key companion.

   ```text
   ~/.ssh/id_rsa_shared
   ~/.ssh/id_rsa_shared.pub
   ```

5. Create a `~/.ssh/config_shared` file and put the following text in it.

   ```text
   Host github.com
     IgnoreUnknown UseKeychain
     AddKeysToAgent yes
     IdentityFile /root/.ssh/id_rsa_shared
   ```

6. _Copy_ the contents of the public-key to your clipboard.

   ```sh
   cat ~/.ssh/id_rsa_shared.pub
   ```

7. [Add the `id_rsa_shared.pub` key to your GitHub Account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account).

### Set up the workspace <a id="set-up-the-workspace"></a>

#### Clone the repo into the current directory <a id="clone-repo"></a>

```sh
git clone https://github.com/seantrane/dotfiles.git dotfiles && cd dotfiles
```

#### Set up the Dev Container... <a id="set-up-the-devcontainer"></a>

[Dev Containers](https://containers.dev) ensure consistency across different environments. Follow these steps to set up a [Dev Container in Visual Studio Code](https://code.visualstudio.com/docs/devcontainers/containers):

1. Install [Docker](https://www.docker.com/get-started) on your machine.

2. Install [Visual Studio Code](https://code.visualstudio.com/) on your machine.

3. Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extensions for VS Code.

   ```sh
   code --install-extension ms-vscode-remote.remote-containers
   code --install-extension ms-vscode-remote.vscode-remote-extensionpack
   ```

Based on your machine's operating system follow the below instructions.

##### ...for Ubuntu/Linux/Mac based machines <a id="ubuntu-linux-machines"></a>

1. Ensure Docker Desktop is up and running in your local machine.

2. Open the project in VS Code from the root of the repository.

3. When prompted, click on the blue _"Reopen in Container"_ button in the bottom-right corner of VS Code or Press `Ctrl+Shift+P` to open the Command Palette click on _"Dev Containers: Reopen in Container"_.

##### ...for Windows based machines <a id="windows-machines"></a>

1. Install and setup [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install) on your windows machine.

2. If you have already configured [SSH authentication](#configure-ssh) and [Cloned the repository](#set-up-the-workspace) in windows then, copy `id_rsa_shared`, `id_rsa_shared.pub` and `config_shared` files from `Windows` to `.ssh` folder in `Linux` using the below commands.

   ```sh
   # Copy .ssh folder to Linux
   cp -r /mnt/c/Users/<username>/.ssh ~/.

   # Get into .ssh folder
   cd .ssh

   # Set necessary permissions to id_rsa_shared
   sudo chmod 600 id_rsa_shared

   # Set necessary permissions to id_rsa_shared.pub
   sudo chmod 600 id_rsa_shared.pub

   ```

3. Clone the repository in `WSL2`

4. Open the project in VS Code from the root of the repository in `WSL2`.

5. When prompted, click on the blue _"Reopen in Container"_ button in the bottom-right corner of VS Code or Press `Ctrl+Shift+P` to open the Command Palette click on _"Dev Containers: Reopen in Container"_.

_Wait for the Dev Container to finish building, before contributing._

#### Working with CSV files <a id="csv-files"></a>

CSV files are tricky to edit/save properly, depending on the software used to open them. Microsoft Excel is capable of opening/editing/saving the file correctly. Some apps will corrupt the data/formatting, resulting in a failing pull request.

### Running tests <a id="running-tests"></a>

#### Static Analysis with MegaLinter <a id="linting"></a>

```sh
# Run linters on entire repository
./run megalinter

# Run linters only on changed files
./run megalinter -e 'VALIDATE_ALL_CODEBASE=false'

# Run linters and apply formatter fixes on changed files
./run megalinter -e 'APPLY_FIXES=all' -e 'VALIDATE_ALL_CODEBASE=false'

# Run a specific version of megalinter
export MEGALINTER_VERSION="v7"; ./run megalinter
```

---

## File Structure <a id="file-structure"></a>

```text
~/.dotfiles/
├─ bin/                       * Anything in `bin/` will get added to your `$PATH`
│  │                            and be made available everywhere.
│  ├─ {binary}                * Any shell script you wish.
│  :
│
├─ functions/                 * Anything in `functions/` will be loaded in environment.
│  ├─ {function}              * Shell function (with filename identical to function name)
│  :
│
├─ {topic}/                   * Directory with files pertaining to a specific topic or application.
│  ├─ aliases.{,ba,z}sh       * Any file named `aliases.{,ba,z}sh` is loaded into your environment.
│  ├─ completion.{ba,z}sh     * Any file named `completion.{ba,z}sh` is loaded last
│  │                            and is expected to setup autocomplete.
│  ├─ path.{,ba,z}sh          * Any file named `path.{,ba,z}sh` is loaded first
│  │                            and is expected to setup `$PATH` or similar.
│  ├─ *.{,ba,z}sh             * Any files ending in `.{,ba,z}sh` get loaded into your environment.
│  ├─ *.symlink               * Any files ending in `*.symlink` get symlinked into your `$HOME`.
│  :                            For example; `npmrc.symlink` would be symlinked to `~/.npmrc`
│                               This is so you can keep all of those versioned in your dotfiles
│                               but still keep those autoloaded files in your home directory.
│                               These get symlinked in when you run `script/bootstrap`.
│
└─ cli                        * Command-line interface
```

## Dotfiles File Structure Explained

```text
~/.dotfiles/                  * dotfiles directory
│
├─ bash/                      * Bash config, env, profile, rc, etc.
├─ bin/                       * Binary scripts (loaded into shell PATH)
├─ brew/                      * Homebrew config, installers, inits
├─ functions/                 * Shell functions (loaded into shell PATH)
├─ git/                       * Git config
├─ macos/                     * macOS config, defaults, prefs, aliases, etc.
├─ script/                    * Shell scripts for installing, maintaining dotfiles
├─ shell/                     * Shell config (common settings for all shells)
├─ system/                    * System/OS config, aliases, paths, etc.
├─ user/                      * User config, aliases, local rc's
├─ zsh/                       * Zsh config, env, profile, rc, etc.
│
├─ cli                        * CI/CD CLI
└─ run                        * "run" helper script
```

## Zsh configuration process

**Legend:**

| icon | description           |
|-----:|:----------------------|
|   👉 | symlinked file        |
|   ⭐️ | very important file   |
| 👀👤 | user file (if exists) |

1. **`/etc/zshenv`**
2. `~/.zshenv` 👉 `~/.dotfiles/zsh/zshenv.symlink` ⭐️
   - `~/.zprofile` 👉 `~/.dotfiles/zsh/zprofile.symlink`
     - _`~/.profile`_ 👀👤
   - `~/.dotfiles/brew/paths.sh`
   - `~/.env` 👉 `~/.dotfiles/system/env.symlink`
     - `~/.dotfiles/shell/response.sh` ⭐️
     - `~/.dotfiles/shell/paths.sh` ⭐️
       - `~/.dotfiles/**/path.{sh,zsh}` ⭐️
       - _`~/.path`_ 👀👤
     - `~/.dotfiles/shell/exports.sh` ⭐️
     - `~/.dotfiles/shell/functions.sh`
       - _`~/.rvm/scripts/rvm`_
       - _`~/.functions`_ 👀👤
     - `~/.dotfiles/functions/*` ⭐️
3. **`/etc/zprofile`** 🛑
4. `~/.zprofile` 👉 `~/.dotfiles/zsh/zprofile.symlink` ⭐️
   - _`~/.profile`_ 👀👤
5. **`/etc/zshrc`**
6. `~/.zshrc` 👉 `~/.dotfiles/zsh/zshrc.symlink` ⭐️
   - _`~/.zprezto/init.zsh`_
   - _`~/.localrc`_ 👀👤
   - `~/.dotfiles/**/aliases.{sh,zsh}` ⭐️
   - _`~/.aliases`_ 👀👤
   - _`/etc/zsh_command_not_found`_
   - `~/.dotfiles/**/completion.zsh` ⭐️
   - _`~/z/z.sh` || `/opt/homebrew/etc/profile.d/z.sh`_
7. **`/etc/zlogin`**
8. `~/.zlogin` 👉 `~/.dotfiles/zsh/zlogin.symlink`
9. **`/etc/zlogout`**
10. `~/.zlogout` 👉 `~/.dotfiles/zsh/zlogout.symlink`

---

#### Happy coding!
