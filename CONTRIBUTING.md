# Contributing

> Thank you for contributing. Contributions are always welcome, no matter how large or small.

## Table of Contents

- [Guidelines](#guidelines)
- [Pull Requests](#pull-requests)
- [Clone the Repository](#clone-repo)
- [Install Dependencies](#install-dependencies)
- [File Structure](#file-structure)

---

## Guidelines <a id="guidelines"></a>

As a contributor, here are the guidelines you should follow:

- [Code of conduct](https://github.com/seantrane/engineering/blob/main/CODE_OF_CONDUCT.md)
- [How can I contribute?](https://github.com/seantrane/engineering/blob/main/CONTRIBUTING.md#how-can-i-contribute)
- [Using the issue tracker](https://github.com/seantrane/engineering/blob/main/CONTRIBUTING.md#using-the-issue-tracker)
- [Submitting a Pull Request](https://github.com/seantrane/engineering/blob/main/CONTRIBUTING.md#submitting-a-pull-request)
- [Coding rules](https://github.com/seantrane/engineering/blob/main/CONTRIBUTING.md#coding-rules)
- [Working with code](https://github.com/seantrane/engineering/blob/main/CONTRIBUTING.md#working-with-code)

We also recommend to read [How to Contribute to Open Source](https://opensource.guide/how-to-contribute).

---

## Pull Requests <a id="pull-requests"></a>

Thank you for contributing.

- Create your branch from `main`.
- Ensure your [git commit messages follow the required format](https://github.com/seantrane/engineering/blob/main/STYLE_GUIDES.md#git-commit-messages).
- Ensure your scripts are well-formed, well-documented and object-oriented.
- Ensure your scripts are stateless and can be reused by all.
- Update your branch, and resolve any conflicts, before making pull request.
- Fill in [the required template](https://github.com/seantrane/engineering/blob/main/PULL_REQUEST_TEMPLATE.md).
- Do not include issue numbers in the PR title.
- Include screenshots and animated GIFs in your pull request whenever possible.
- Follow the [style guide](https://github.com/seantrane/engineering/blob/main/STYLE_GUIDES.md) [applicable to the language](https://github.com/seantrane/engineering/blob/main/STYLE_GUIDES.md#languages) or task.
- Include thoughtfully-worded, well-structured tests/specs. See the [Tests/Specs Style Guide](https://github.com/seantrane/engineering/blob/main/STYLE_GUIDES.md#tests).
- Document new code based on the [Documentation Style Guide](https://github.com/seantrane/engineering/blob/main/STYLE_GUIDES.md#documentation).
- End all files with a newline.

---

## Clone the Repository <a id="clone-repo"></a>

```bash
git clone https://github.com/seantrane/dotfiles.git dotfiles && cd dotfiles
```

---

## File Structure <a id="file-structure"></a>

```text
~/.dotfiles/
├─ bin/                       * Anything in `bin/` will get added to your `$PATH`
│  │                            and be made available everywhere.
│  ├─ {binary}                * Any shell script you wish
│  :
│
├─ functions/                 * Anything in `functions/` will get added to your `$PATH`
│  │                            and be made available everywhere.
│  ├─ {function}              * Shell function (with filename identical to function name)
│  :
│
├─ {topic}/                   * Directory with files pertaining to a specific topic or application.
│  ├─ aliases.zsh             * Any file named `aliases.zsh` is loaded into your environment.
│  ├─ completion.zsh          * Any file named `completion.zsh` is loaded last
│  │                            and is expected to setup autocomplete.
│  ├─ path.zsh                * Any file named `path.zsh` is loaded first
│  │                            and is expected to setup `$PATH` or similar.
│  ├─ *.zsh                   * Any files ending in `.zsh` get loaded into your environment.
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
~/
├─ .dotfiles/                                   * TBD
│  ├─ bash/                                     * TBD
│  ├─ bin/                                      * TBD
│  ├─ brew/                                     * TBD
│  ├─ functions/                                * TBD
│  ├─ git/                                      * TBD
│  ├─ macos/                                    * TBD
│  ├─ script/                                   * TBD
│  ├─ shell/                                    * TBD
│  ├─ system/                                   * TBD
│  ├─ user/                                     * TBD
│  └─ zsh/                                      * TBD
│
└─ cli                                          * TBD
```

## Zsh configuration process

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
