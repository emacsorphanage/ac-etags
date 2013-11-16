# ac-etags.el

## Introduction

`ac-etags.el` is etags completion source for [auto-complete](https://github.com/auto-complete/auto-complete).

## Commands

#### `ac-etags-setup`

Setup auto-complete source for etags. This command must be called at the beginning.

## Customize Variables

#### `ac-etags-requires`(Default `3`)

Required number of characters of this source completion

## Sample Configuration

```elisp
(custom-set-variable
  '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
      (ac-etags-setup)))
```
