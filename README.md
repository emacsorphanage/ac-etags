# ac-etags.el [![melpa badge][melpa-badge]][melpa-link] [![melpa stable badge][melpa-stable-badge]][melpa-stable-link]

## Introduction

`ac-etags.el` is etags/ctags completion source for [auto-complete](https://github.com/auto-complete/auto-complete).
You can use this package with etags/ctags of Emacs and [Exuberant Ctags](http://ctags.sourceforge.net/)


## Screenshot

![ac-etags](image/ac-etags.png)


## Installation

`ac-etags` is available on [MELPA](https://melpa.org/) and [MELPA stable](https://stable.melpa.org/)

You can install `ac-etags` with the following command.

<kbd>M-x package-install [RET] ac-etags [RET]</kbd>


## Requirements

- Emacs 23 or higher
- [auto-complete](https://github.com/auto-complete/auto-complete)


## Commands

#### `ac-etags-setup`

Setup auto-complete source for etags. This command must be called at the beginning.

#### `ac-etags-ac-setup`

Setup etags `auto-complete` source and enable `auto-complete-mode` if
`auto-complete` is not enabled.

#### `ac-etags-clear-cache`

Clear completions cache. You should clear cache if you switch project and TAGS file.

## Customize Variables

#### `ac-etags-requires`(Default `3`)

Required number of characters of this source completion.
You should change this value before calling `ac-etags-setup`.

I recommend to use `custom-set-variables` for setting this value.


## Sample Configuration

```lisp
(custom-set-variables
  '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
      (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'ruby-mode-common-hook 'ac-etags-ac-setup)
```

## Usage

### First: Generate TAG file

```
 # Create TAG file with etags
 % etags *.c *.h

 # Create TAG file with Exuberant Ctags(You must specify '-e' option)
 % ctags -e *.c *.h
```

### Second: Set path of TAGS

Set path of TAG by `M-x visit-tags-table`

### Finally

You can completion with etags/ctags now.

[melpa-link]: https://melpa.org/#/ac-etags
[melpa-stable-link]: https://stable.melpa.org/#/ac-etags
[melpa-badge]: https://melpa.org/packages/ac-etags-badge.svg
[melpa-stable-badge]: https://stable.melpa.org/packages/ac-etags-badge.svg
