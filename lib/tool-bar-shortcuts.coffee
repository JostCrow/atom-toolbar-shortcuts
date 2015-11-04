module.exports =
    deactivate: ->
        @toolBar?.removeItems()

    config:
        openFile:
            title: 'Show Open File'
            description: 'Show or hide the open file icon'
            type: 'boolean'
            default: true
        openFolder:
            title: 'Show Open Folder'
            description: 'Show or hide the open folder icon'
            type: 'boolean'
            default: true
        gitProjects:
            title: 'Show Git Projects'
            description: 'Show or hide the git projects icon'
            type: 'boolean'
            default: false
        unGit:
            title: 'Show Ungit'
            description: 'Show or hide the ungit icon'
            type: 'boolean'
            default: false
        blame:
            title: 'Show Blame'
            description: 'Show or hide the blame icon'
            type: 'boolean'
            default: false
        terminalPlus:
            title: 'Show Terminal Plus'
            description: 'Show or hide the terminal plus icon'
            type: 'boolean'
            default: false
        splitRight:
            title: 'Show Split Right'
            description: 'Show or hide the split right icon'
            type: 'boolean'
            default: true
        splitDown:
            title: 'Show Split Down'
            description: 'Show or hide the split down icon'
            type: 'boolean'
            default: true
        commentLine:
            title: 'Show Comment Line'
            description: 'Show or hide the comment line icon'
            type: 'boolean'
            default: true
        commentBlock:
            title: 'Show Block Comment'
            description: 'Show or hide the block comment icon'
            type: 'boolean'
            default: true
        markdownPreview:
            title: 'Show Markdown Preview'
            description: 'Show or hide the markdown preview icon'
            type: 'boolean'
            default: true
        fullScreen:
            title: 'Show Full Screen'
            description: 'Show or hide the full screen icon'
            type: 'boolean'
            default: true
        treeView:
            title: 'Show Treeview'
            description: 'Show or hide the treeview icon'
            type: 'boolean'
            default: true
        miniMap:
            title: 'Show Minimap'
            description: 'Show or hide the minimap icon'
            type: 'boolean'
            default: true
        settings:
            title: 'Show Settings'
            description: 'Show or hide the settings icon'
            type: 'boolean'
            default: true
        devTools:
            title: 'Show Dev Tools'
            description: 'Show or hide the dev tools icon'
            type: 'boolean'
            default: true
        reload:
            title: 'Show Reload'
            description: 'Show or hide the reload icon'
            type: 'boolean'
            default: true

    consumeToolBar: (toolBar) ->
        @toolBar = toolBar 'tool-bar-besser'

        openFile = atom.config.get('tool-bar-shortcuts.openFile')
        openFolder = atom.config.get('tool-bar-shortcuts.openFolder')

        if openFile
            @toolBar.addButton
                icon: 'file-text'
                callback: 'application:open-file'
                tooltip: 'Open File'
                iconset: 'fa'

        if openFolder
            @toolBar.addButton
                icon: 'folder-open'
                callback: 'application:open-folder'
                tooltip: 'Open Folder'
                iconset: 'fa'

        if openFile or openFolder
            @toolBar.addSpacer()

        gitProjects = atom.config.get('tool-bar-shortcuts.gitProjects')
        unGit = atom.config.get('tool-bar-shortcuts.unGit')
        blame = atom.config.get('tool-bar-shortcuts.blame')

        if gitProjects and atom.packages.loadedPackages['git-projects']
            @toolBar.addButton
                icon: 'git'
                callback: 'git-projects:toggle'
                tooltip: 'Git Projects'
                iconset: 'fa'

        if unGit and atom.packages.loadedPackages['atom-ungit']
            @toolBar.addButton
                icon: 'code-fork'
                callback: 'ungit:toggle'
                tooltip: 'Ungit'
                iconset: 'fa'

        if blame and atom.packages.loadedPackages['blame']
            @toolBar.addButton
                icon: 'organization'
                callback: 'blame:toggle'
                tooltip: 'Ungit'

        if unGit or gitProjects or blame
            @toolBar.addSpacer()

        terminalPlus = atom.config.get('tool-bar-shortcuts.terminalPlus')

        if terminalPlus and atom.packages.loadedPackages['terminal-plus']
            @toolBar.addButton
                icon: 'terminal'
                callback: 'terminal-plus:new'
                tooltip: 'New Terminal'
                iconset: 'fa'

            @toolBar.addSpacer()

        splitRight = atom.config.get('tool-bar-shortcuts.splitRight')
        splitDown = atom.config.get('tool-bar-shortcuts.splitDown')

        if splitRight
            @toolBar.addButton
                icon: 'columns'
                callback: 'pane:split-right'
                tooltip: 'Split screen - Horizontally'
                iconset: 'fa'

        if splitDown
            @toolBar.addButton
                icon: 'columns fa-rotate-270'
                callback: 'pane:split-down'
                tooltip: 'Split screen - Vertically'
                iconset: 'fa'

        if splitRight or splitDown
            @toolBar.addSpacer()

        commentLine = atom.config.get('tool-bar-shortcuts.commentLine')
        commentBlock = atom.config.get('tool-bar-shortcuts.commentBlock')
        markdownPreview = atom.config.get('tool-bar-shortcuts.markdownPreview')

        if commentLine
            @toolBar.addButton
                icon: 'pound'
                callback: 'editor:toggle-line-comments'
                tooltip: 'Line Comments'
                iconset: 'ion'

        if commentBlock
            @toolBar.addButton
                icon: 'quote'
                callback: 'block-comment:toggle'
                tooltip: 'Line Comments'
                iconset: 'ion'

        if markdownPreview
            @toolBar.addButton
                icon: 'social-markdown'
                callback: 'markdown-preview:toggle'
                tooltip: 'Show Markdown Preview'
                iconset: 'ion'

        if commentLine or commentBlock or markdownPreview
            @toolBar.addSpacer()

        fullScreen = atom.config.get('tool-bar-shortcuts.fullScreen')
        treeView = atom.config.get('tool-bar-shortcuts.treeView')
        miniMap = atom.config.get('tool-bar-shortcuts.miniMap')

        if fullScreen
            @toolBar.addButton
                icon: 'expand'
                callback: 'window:toggle-full-screen'
                tooltip: 'Toggle Fullscreen'
                iconset: 'fa'

        if treeView
            @toolBar.addButton
                icon: 'sitemap'
                callback: 'tree-view:toggle'
                tooltip: 'Toggle Sidebar'
                iconset: 'fa'

        if miniMap
            @toolBar.addButton
                icon: 'map'
                callback: 'minimap:toggle'
                tooltip: 'Toggle Minimap'
                iconset: 'fa'

        if fullScreen or treeView or miniMap
            @toolBar.addSpacer()

        settings = atom.config.get('tool-bar-shortcuts.settings')
        devTools = atom.config.get('tool-bar-shortcuts.devTools')

        if settings
            @toolBar.addButton
                icon: 'cogs'
                callback: 'settings-view:open'
                tooltip: 'Open Settings View'
                iconset: 'fa'

        if devTools
            @toolBar.addButton
                icon: 'bug'
                callback: 'window:toggle-dev-tools'
                tooltip: 'Open Dev Tools'
                iconset: 'fa'

        if settings and devTools
            @toolBar.addSpacer()

        reload = atom.config.get('tool-bar-shortcuts.reload')

        if reload
            @toolBar.addButton
                icon: 'refresh'
                callback: 'window:reload'
                tooltip: 'Reload Window'
                iconset: 'fa'
