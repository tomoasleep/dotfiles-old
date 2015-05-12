
atom.workspace.observeActivePaneItem (activeItem) ->
  atom.commands.dispatch document.querySelector('body'), 'application:new-file' unless activeItem
