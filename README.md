# dashdaddy.vim

An awesome hackeable dashboard plugin for vim. Welcome to the new generation of configurations for Vim, style your configuration much more, being able to add a customizable dashboard in a simple way!

### Install

To install via vim-plug, we can do it this way, add the following statement to your configuration file:
```vimscript
Plug 'BrunoCiccarino/dashdaddy.vim'
```
Then press esc to exit insertion mode and run :PlugInstall

To install via vundle it's very similar, you just need to add the following instructions to your configuration file:
```vimscript 
Plugin 'BrunoCiccarino/dashdaddy.vim'
```
Then you repeat the process by pressing esc and typing :PluginInstall

### Example

```vimscript
let g:dashboard_config = {
      \ 'title': 'Welcome to My Vim Dashboard!',
      \ 'ascii_art': [
      \   '______          _    ______          _     _       ',
      \   '|  _  \        | |   |  _  \        | |   | |      ',
      \   '| | | |__ _ ___| |__ | | | |__ _  __| | __| |_   _ ',
      \   '| | | / _` / __| \'_ \| | | / _` |/ _` |/ _` | | | |',
      \   '| |/ / (_| \__ \ | | | |/ / (_| | (_| | (_| | |_| |',
      \   '|___/ \__,_|___/_| |_|___/ \__,_|\__,_|\__,_|\__, |',
      \   '                                             __/ |',
      \   '                                            |___/ '
      \ ],
      \ 'shortcuts': [
      \     {'label': 'Edit Config', 'command': ':e ~/.vimrc<CR>'},
      \     {'label': 'Quit Vim', 'command': ':qa!<CR>'}
      \   ]
      \ }
``` 
