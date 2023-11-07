# Color Configuration for `ls` _(`LS_COLORS`)_

> TLDR: _`lscolors` generator tool: [http://geoff.greer.fm/lscolors/]_

## LSCOLORS

The value of this variable describes what color to use for which attribute when colors are enabled with `CLICOLOR`. This string is a concatenation of pairs of the format `fb`, where `f` is the foreground color and `b` is the background color.

The color designators are as follows:

| Code | Description                               |
|:----:|:------------------------------------------|
| `a`  | black                                     |
| `b`  | red                                       |
| `c`  | green                                     |
| `d`  | brown                                     |
| `e`  | blue                                      |
| `f`  | magenta                                   |
| `g`  | cyan                                      |
| `h`  | light grey                                |
| `A`  | bold black, usually shows up as dark grey |
| `B`  | bold red                                  |
| `C`  | bold green                                |
| `D`  | bold brown, usually shows up as yellow    |
| `E`  | bold blue                                 |
| `F`  | bold magenta                              |
| `G`  | bold cyan                                 |
| `H`  | bold light grey; looks like bright white  |
| `x`  | default foreground or background          |

Note that the above are standard ANSI colors. The actual display may differ depending on the color capabilities of the terminal in use.

The order of the attributes are as follows:

1. directory
2. symbolic link
3. socket
4. pipe
5. executable
6. block special
7. character special
8. executable with `setuid` bit set
9. executable with `setgid` bit set
10. directory writable to others, with sticky bit
11. directory writable to others, without sticky bit

The default is `exfxcxdxbxegedabagacad`, i.e. blue foreground and default background for regular directories, black foreground and red background for `setuid` executables, etc.

## LS_COLORS

`LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31'`

Parameters for `LS_COLORS` (`di`, `fi`, ...) refer to different file types:

| Code | Description                                                     |
|:----:|:----------------------------------------------------------------|
| `no` | No color code at all                                            |
| `fi` | Regular file: use no color at all                               |
| `rs` | Reset to "normal" color                                         |
| `di` | Directory                                                       |
| `ln` | Symbolic Link                                                   |
| `mh` | MULTIHARDLINK - regular file with more than one link            |
| `pi` | Named pipe, Fifo file                                           |
| `so` | Socket file                                                     |
| `do` | Door file                                                       |
| `bd` | Block device driver, (buffered) special file                    |
| `cd` | Character device driver, (unbuffered) special file              |
| `or` | Orphan symlink to nonexistent file, or non-`stat`'able file     |
| `mi` | Non-existent file symlinked (visible when you type `ls -l`)     |
| `su` | Normal file that is `setuid` (`u+s`)                            |
| `sg` | Normal file that is `setgid` (`g+s`)                            |
| `ca` | File with capability (very expensive to lookup)                 |
| `tw` | Directory that is sticky and other-writable (`+t`,`o+w`)        |
| `ow` | Directory that is other-writable (`o+w`) and not sticky         |
| `st` | Directory with the sticky bit set (`+t`) and not other-writable |
| `ex` | File which is executable (ie. has `x` set in permissions)       |

### Color Codes

|  Code | Description                            |
|------:|:---------------------------------------|
|   `0` | Default Color                          |
|   `1` | Bold                                   |
|   `2` | Dim                                    |
|   `3` | Italic                                 |
|   `4` | Underlined                             |
|   `5` | Blinking Text                          |
|   `7` | Reverse Text                           |
|   `8` | Conceal Text (Hidden)                  |
|  `30` | Black                                  |
|  `31` | Red                                    |
|  `32` | Green                                  |
|  `33` | Yellow                                 |
|  `34` | Blue                                   |
|  `35` | Magenta                                |
|  `36` | Cyan                                   |
|  `37` | White/Grey                             |
|  `39` | Default                                |
|  `40` | Black Background                       |
|  `41` | Red Background                         |
|  `42` | Green Background                       |
|  `43` | Yellow Background                      |
|  `44` | Blue Background                        |
|  `45` | Magenta Background                     |
|  `46` | Cyan Background                        |
|  `47` | White/Grey Background                  |
|  `49` | Default Background                     |
|  `90` | Black - High Intensity                 |
|  `91` | Red - High Intensity                   |
|  `92` | Green - High Intensity                 |
|  `93` | Yellow - High Intensity                |
|  `94` | Blue - High Intensity                  |
|  `95` | Magenta - High Intensity               |
|  `96` | Cyan - High Intensity                  |
|  `97` | White/Grey - High Intensity            |
|  `99` | Default - High Intensity               |
| `100` | Black Background - High Intensity      |
| `101` | Red Background - High Intensity        |
| `102` | Green Background - High Intensity      |
| `103` | Yellow Background - High Intensity     |
| `104` | Blue Background - High Intensity       |
| `105` | Magenta Background - High Intensity    |
| `106` | Cyan Background - High Intensity       |
| `107` | White/Grey Background - High Intensity |
| `109` | Default Background - High Intensity    |

These codes can also be combined with one another:

```txt
di=5;34;43
```
