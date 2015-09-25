{ SelectListView } = require 'atom-space-pen-views'
remote = require 'remote'

class WindowSelectListView extends SelectListView
  initialize: ->
    super
    atomApplication = remote.getGlobal('atomApplication')
    items = for item in atomApplication.windows
      window: item
      title: item.browserWindow.getTitle()
    @setItems(items)
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @focusFilterEditor()

  viewForItem: (item) ->
    "<li>#{item.title}</li>"

  getFilterKey: -> 'title'

  cancelled: ->
    @panel?.destroy()

  confirmed: (item) ->
    item.window.focus()

atom.commands.add 'atom-workspace',
  'user:show-windows': ->
    new WindowSelectListView()
