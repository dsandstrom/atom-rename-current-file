{View} = require 'atom'

module.exports =
class RenameCurrentFileView extends View
  @content: ->
    @div class: 'rename-current-file overlay from-top', =>
      @div "The RenameCurrentFile package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "rename-current-file:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "RenameCurrentFileView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
