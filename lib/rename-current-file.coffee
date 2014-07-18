RenameCurrentFileView = require './rename-current-file-view'

# fs = require 'fs'
# path = require 'path'
# S = require 'string'

MoveDialog = require './move-dialog'
# dialog = new MoveDialog()

module.exports =
  renameCurrentFileView: null

  activate: ->
    atom.workspaceView.command "rename-current-file:rename", => @rename()
  
  rename: ->
    editor = atom.workspace.getActiveEditor()
    currentName = editor.getTitle()
    # console.log currentName
    # prompt.show
    #   label: currentName,
    #   editor: editor
    # atom.workspace.saveActivePaneItemAs()
    currentFile = atom.workspace.getActivePaneItem()
    # console.log currentFile
    oldPath = currentFile.getPath()
    # oldPath = currentName
    dialog = new MoveDialog(oldPath)
    dialog.attach()
