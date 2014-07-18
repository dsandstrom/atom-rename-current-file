MoveDialog = require './move-dialog'

module.exports =
  activate: ->
    atom.workspaceView.command "rename-current-file:rename", => @rename()
  
  rename: ->
    pane = atom.workspace.getActivePane()
    entry = atom.workspace.getActivePaneItem()
    # index = pane.getIndex
    return unless entry and entry isnt @root
    oldPath = entry.getPath()
    dialog = new MoveDialog(oldPath)
    dialog.attach()
    # pane.addItem(entry, 0)
    # console.log entry
