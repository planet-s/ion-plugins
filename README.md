# The Ion official plugins

This repository contains many useful aliases and functions definitions to improve the quality of your Ion setup.

**Disclaimer**: Most of the plugins are a one-on-one equivalent with the great oh-my-zsh plugins to make users' transitions as seamless as possible. See the [equivalence sheet](./plugins.md) to see if your plugins are all converted.

## Installation

### 1. Clone the repo
```
git clone https://gitlab.redox-os.org/redox-os/ion-plugins ~/.config/ion/plugins
```

### 2. Use it in your config (~/.config/ion/initrc)
```
source ~/.config/ion/plugins/<plugin>/init.ion
...
```

## How to use plugins
Use them by sourcing their files. A list of plugins can be found [here](http://redox-os.pages.redox-os.org/ion-plugins/).

## Creating your own
Plugins are stored in a directory under ~/.config/ion/plugins with the following structure:
```
plugins/
  <section>/
    - <plugin>.ion
  ...
```
The ion script is read at the shell launch and should register its functions.
A comment describing the plugin should be placed at the begining of the file if you wish to send it upstream. It will be sourced for the pages documentation.

## Themes
Themes are provided for example in the themes folder. Note however that it is highly recommended that you create your own, as it is quite simple to build with colors in Ion. For more complex logic, plugins provide with helpers.
For native rust theming, see the [candypaint](https://gitlab.redox-os.org/coleman/candypaint) repo.
For powerline, see [powerline-rs](https://gitlab.com/jD91mZM2/powerline-rs#ion).

## Contributors
Feel free to pick an issue and/or send patches for additional features.

## Uninstallation (but you won't need this)
Simply remove the 3 lines added in the installation section as well as running `rm -rf ~/.config/ion/plugins` and boom, it's gone

## License
Ion-plugins is released under the MIT license
