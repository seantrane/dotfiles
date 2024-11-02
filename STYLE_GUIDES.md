# Style Guides

> Please follow the style guide applicable to the language or task.

## Table of Contents

- [Git Commit Messages](#git-commit-messages)
- [Tests/Specs](#tests)
- [Documentation](#documentation)
- [Source Code](#source-code)
  - [Lint](#lint)
- [Languages](#languages)
  - [HTML/CSS](#html-css)
  - [Java](#java)
  - [JavaScript/TypeScript](#javascript)
  - [PHP](#php)
  - [Python](#python)
  - [Ruby](#ruby)
  - [Shell](#shell)

---

## Git Commit Messages <a id="git-commit-messages"></a>

### Atomic commits

If possible, make [atomic commits](https://en.wikipedia.org/wiki/Atomic_commit), which means:

- a commit should contain exactly one self-contained functional change
- a functional change should be contained in exactly one commit
- a commit should not create an inconsistent state (such as test errors, linting errors, partial fix, feature with documentation etc...)

A complex feature can be broken down into multiple commits as long as each one keep a consistent state and consist of a self-contained change.

### Commit message format

Please use the [_conventional commit_ format](https://commitlint.io/#Conventional). This enables machine processing of changes, to automate changelogs and release notes.

Each commit message consists of a **header**, a **body** and a **footer**. The header has a special format that includes a **type**, a **scope** and a **subject**:

```commit
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The **header** is mandatory and the **scope** of the header is optional.

The **footer** can contain a [closing reference to an issue](https://help.github.com/articles/closing-issues-via-commit-messages).

### Revert

If the commit reverts a previous commit, it should begin with `revert:`, followed by the header of the reverted commit. In the body it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit being reverted.

### Type

The type must be one of the following:

| Type         | Description                                                                                                 |
|--------------|-------------------------------------------------------------------------------------------------------------|
| **build**    | Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)         |
| **chore**    | Administrative and management tasks                                                                         |
| **ci**       | Changes to the CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs) |
| **docs**     | Documentation only changes                                                                                  |
| **feat**     | A new feature                                                                                               |
| **fix**      | A bug fix                                                                                                   |
| **perf**     | A code change that improves performance                                                                     |
| **refactor** | A code change that neither fixes a bug nor adds a feature                                                   |
| **style**    | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)      |
| **test**     | Adding missing tests or correcting existing tests                                                           |

### Subject

The subject contains succinct description of the change:

- use the imperative, present tense: "change" not "changed" nor "changes"
- don't capitalize first letter
- no dot (.) at the end
- limit to 72 characters or less

### Body

Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes".
The body should include the motivation for the change and contrast this with previous behavior.
When only changing documentation, include `[ci skip]` in the commit body.

### Footer

The footer should contain any information about **Breaking Changes** and is also the place to reference GitHub issues that this commit **Closes**.

**Breaking Changes** should start with the word `BREAKING CHANGE:` with a space or two newlines. The rest of the commit message is then used for this.

### Examples

```commit
`fix(pencil): stop graphite breaking when too much pressure applied`
```

```commit
`feat(pencil): add 'graphiteWidth' option`

Fix #42
```

```commit
perf(pencil): remove graphiteWidth option`

BREAKING CHANGE: The graphiteWidth option has been removed.

The default graphite width of 10mm is always used for performance reasons.
```

## Tests/Specs <a id="tests"></a>

- Include thoughtfully-worded, well-structured tests in the `./tests` folder.
- Treat `describe` as a noun or situation.
- Treat `it` as a statement about state or how an operation changes state.

## Documentation <a id="documentation"></a>

To ensure consistency and quality all documentation modification must:

- Use [Markdown](https://daringfireball.net/projects/markdown)
- Refer to brand in [bold](https://help.github.com/articles/basic-writing-and-formatting-syntax/#styling-text) with proper capitalization, i.e.; **GitHub**, **npm**
- Prefer [tables](https://help.github.com/articles/organizing-information-with-tables) over [lists](https://help.github.com/articles/basic-writing-and-formatting-syntax/#lists) when listing key values, i.e.; List of options with their description
- Use [links](https://help.github.com/articles/basic-writing-and-formatting-syntax/#links) when, the first you are referring to:
  - a concept described somewhere else in the documentation, i.e.; How to [contribute](CONTRIBUTING.md)
  - a third-party product/brand/service, i.e.; Integrate with [GitHub](https://github.com)
  - an external concept or feature, i.e.; Create a [GitHub release](https://help.github.com/articles/creating-releases)
  - a package or module, i.e.; The [`@profile/repo`](https://github.com/profile/repo) module
- Use [single backtick `code` quoting](https://help.github.com/articles/basic-writing-and-formatting-syntax/#quoting-code) for:
  - commands inside sentences, i.e.; the `docker run` command
  - programming language keywords, i.e.; `function`, `async`, `String`
  - packages or modules, i.e.; The [`@profile/repo`](https://github.com/profile/repo) module
- Use [triple backtick `code` formatting](https://help.github.com/articles/creating-and-highlighting-code-blocks) for:
  - code examples
  - configuration examples
  - sequence of command lines
- Reference methods and classes in markdown with the custom `{}` notation:
  - Reference classes with `{ClassName}`
  - Reference instance methods with `{ClassName::methodName}`
  - Reference class methods with `{ClassName.methodName}`

---

## Source Code <a id="source-code"></a>

To ensure consistency and quality throughout the source code, all code modification must have:

- No [linting](#lint) errors
- A [test](#tests) for every possible cases introduced by your code change
- **100%** test coverage
- [Valid commit message(s)](#git-commit-messages)
- Documentation for new features
- Updated documentation for modified features

### Lint <a id="lint"></a>

Before pushing your code changes make sure there is no linting errors, i.e.; `megalinter`.

**Tips**:

- Many linting errors can be automatically fixed, i.e.; `megalinter`.
- Your IDE may have a plugin to see linting errors directly in your editor and automatically fix them on save.

---

## Languages <a id="languages"></a>

### HTML/CSS <a id="html-css"></a>

- All HTML/CSS must adhere to [Google's HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html).

### Java <a id="java"></a>

- All Java syntax must adhere to [Google's Java Style Guide](https://google.github.io/styleguide/javaguide.html).

### JavaScript/TypeScript <a id="javascript"></a>

- All JavaScript syntax must adhere to [Google's Shell Style Guide](https://google.github.io/styleguide/jsguide.html).
- All JavaScript syntax should adhere to [JavaScript Standard Style](http://standardjs.com/).
- All Angular syntax must adhere to [The Angular Style Guide](https://angular.io/guide/styleguide).
- Run [`jslint`](http://www.jslint.com/) or [`tslint`](https://palantir.github.io/tslint/) over your code.

### PHP <a id="php"></a>

- All PHP syntax must adhere to [PSR-2 Coding Style Guide](http://www.php-fig.org/psr/psr-2/).

### Python <a id="python"></a>

- All Python syntax must adhere to [Google's Python Style Guide](https://google.github.io/styleguide/pyguide.html).
- Run [`pylint`](https://www.pylint.org/) over your code.

### Ruby <a id="ruby"></a>

- All Ruby syntax must adhere to [The Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).
- Run [`rubocop`](https://github.com/bbatsov/rubocop) over your code.

### Shell <a id="shell"></a>

- All Shell syntax must adhere to [Google's Shell Style Guide](https://google.github.io/styleguide/shell.xml).
- Run [ShellCheck](http://www.shellcheck.net/) over your code.

---
