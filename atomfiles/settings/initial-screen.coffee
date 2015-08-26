{ delay } = require './utils'

atom.workspace.observeActivePaneItem (activeItem) ->
  atom.commands.dispatch document.querySelector('body'), 'application:new-file' unless activeItem

delay ->
  # Ensure open an editor pane.
  unless atom.workspace.getTextEditors().length
    atom.workspace.open()
