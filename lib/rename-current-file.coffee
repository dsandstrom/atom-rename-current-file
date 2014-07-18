RenameCurrentFileView = require './rename-current-file-view'

# fs = require 'fs'
# path = require 'path'
# S = require 'string'

PromptView = require './prompt'
prompt = new PromptView()

module.exports =
  renameCurrentFileView: null

  activate: ->
    atom.workspaceView.command "rename-current-file:rename", => @rename()
  
  rename: ->
    editor = atom.workspace.getActiveEditor()
    currentName = editor.getTitle()
    console.log currentName
    prompt.show
      label: currentName,
      editor: editor
