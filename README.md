# Toolbar Shortcuts - a tool-bar plugin

## Description

An atom-tool-bar plugin that adds many commonly used actions in the tool-bar.

This is just a preview of how it can look.

![screenshot](https://raw.githubusercontent.com/JostCrow/atom-toolbar-shortcuts/master/screenshot.png)

Availeble options:
1. Open file
2. Open folder
* Toggle git projects (requires **git-projects** package)
* Toggle Ungit (requires **atom-ungit** package)
* Toggle Blame (requires **blame** package)
* Open Terminal (requires **terminal-plus** package)
* Split left
* Split bottom
* Comment line
* Comment block (requires **block-comment** package)
* Toggle Markdown preview
* Toggle Fullscreen
* Toggle Tree-view
* Toggle Minimap (requires **minimap** package)
* Settings
* Dev Tools
* Reload window

*The toolbar buttons that require other packages will only appear if you have those packages installed and if you have selected them in the settings*

## Sugestions

If you have sugestions for this package. Create an issue.

## Installation

First you have to install the `tool-bar` package which is required:

```bash
apm install tool-bar
```

Then you install the `tool-bar-shortcuts` package:

```bash
apm install tool-bar-shortcuts
```

## TODO

- [x] Create package settings to choose wich items you want to show in the toolbar.
- [ ] Change package settings to reorder toolbar items (including separators).
- [ ] Reload the toolbar on settings change.

## License

The MIT License
