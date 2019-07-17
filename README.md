# The Ion official plugins

This repository contains many useful aliases and functions definitions to improve the quality of your Ion setup.

**Disclaimer**: Most of the plugins are a one-on-one equivalent with the great oh-my-zsh plugins to make users' transitions as seamless as possible. See the [equivalence sheet](./plugins.md) to see if your plugins are all converted.

## Installation

### 1. Clone the repo
```
git clone https://gitlab.redox-os.org/redox-os/ion-plugins ~/.config/ion/plugins
```

### 2. Use it in your config (~/.config/ion/initrc)
#### For now
```
source ~/.config/ion/plugins/themes/<theme>/init.ion
source ~/.config/ion/plugins/<plugin>/init.ion
...
```

#### Planned API
```
... rest of initrc
source ~/.config/ion/plugins/init.ion
load_theme robbyrussel
load [ git yarn ... ]
```

## What's provided
### Plugins
Use them by adding their identifiers to the `load` array parameter. A list of plugins is simply the folders that are included in the repo

#### Adding your own
Plugins are stored in a directory under ~/.config/ion/plugins with the following structure:
```
plugins/
  my-plugin/
    - init.ion
    - README.md
  ...
```
The init.ion is read at the shell lauch and should register its functions.

### Themes
Themes are stored under ~/.config/ion/plugins/themes. You can load the one you like with `load_theme <your theme>`

## Contributors
Feel free to pick an issue and/or send patches for additional features.

## Uninstallation (but you won't need this)
Simply remove the 3 lines added in the installation section as well as running `rm -rf ~/.config/ion/plugins` and boom, it's gone

## License
Ion-plugins is released under the MIT license
