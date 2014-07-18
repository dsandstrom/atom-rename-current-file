{WorkspaceView} = require 'atom'
RenameCurrentFile = require '../lib/rename-current-file'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RenameCurrentFile", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('rename-current-file')

  describe "when the rename-current-file:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.rename-current-file')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'rename-current-file:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.rename-current-file')).toExist()
        atom.workspaceView.trigger 'rename-current-file:toggle'
        expect(atom.workspaceView.find('.rename-current-file')).not.toExist()
