# Vundle plugin

This plugin adds functions to control [vundle](https://github.com/VundleVim/Vundle.vim) plug-in manager for vim.

## Functions

| Function      | Usage           | Description                                                                |
|---------------|-----------------|----------------------------------------------------------------------------|
| vundle\_init   | `vundle_init`   | Install vundle by cloning git repository into ~/.vim folder                |
| vundle        | `vundle`        | Install plugins set in .vimrc (equals `:PluginInstall`)                    |
| vundle\_update | `vundle_update` | Update plugins set in .vimrc (equals `:PluginInstall!`)                    |
| vundle\_clean  | `vundle_clean`  | Delete plugins that have been removed from .vimrc (equals `:PluginClean!`) |

