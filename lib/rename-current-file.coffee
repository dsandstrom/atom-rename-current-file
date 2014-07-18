MoveDialog = require './move-dialog'

module.exports =
  activate: ->
    atom.workspaceView.command "rename-current-file:rename", => @rename()
  
  rename: ->
    entry = atom.workspace.getActivePaneItem()
    return unless entry and entry isnt @root
    oldPath = entry.getPath()
    dialog = new MoveDialog(oldPath)
    dialog.attach()
