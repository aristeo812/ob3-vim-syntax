# Vim syntax highligting for Openbox-3 theme files

## Installation

### Automatic

When using [vim-plug](https://github.com/junegunn/vim-plug), add following lines in your `~/.vimrc file`:

  call plug#begin('~/.vim/plugged')
    Plug 'aristeo812/ob3-vim-syntax'
  call plug#end()

### Manual

Just copy the `ftdetect` and `syntax` folders in your `~/.vim` directory.

## Usage

The plugin would automatically detect Openbox theming file as a `themerc` file in an `openbox-3` directory. If you want a more general approach, add the following line in your `~/.vimrc` file:

  autocmd BufRead,BufNewFile *themerc set filetype=ob3

Also, you can always set the desired filetype manually by entering the following command in `vim`:

  set ft=ob3

## Authors

The original author is Dave Foster. Modified by Victor Brand (Zhuravlev).
  
