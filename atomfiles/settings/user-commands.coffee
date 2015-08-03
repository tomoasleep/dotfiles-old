
# toggle tab bar
atom.commands.add 'atom-workspace',
  'user:toggle-tab-bar', ->
    @classList.toggle('disable-tab-bar')

atom.commands.add 'atom-text-editor',
  'user:write': ->
    @dispatchEvent(
      new CustomEvent('core:save', bubbles: true, cancelable: true))
  'user:quit': ->
    @dispatchEvent(
      new CustomEvent('core:close', bubbles: true, cancelable: true))

atom.commands.add 'atom-workspace',
  'user:hub-clone', ->
    path = require 'path'
    _ = require 'underscore-plus'
    { createSpecializedClass } = require './utils'

    createSpecializedClass(
      gather: -> [],
      execute: (data) ->
        gitClone(data, path.join('~/Sources', _.last(data.split('/'))))
    ).show()

atom.commands.add 'atom-text-editor',
  'user:delete-to-slash', ->
    editor = @getModel()
    cursor = editor.getLastCursor()
    beginning = cursor.getBeginningOfCurrentWordBufferPosition(wordRegex: /([^\/\s]+[\/\s]*)|([\/\s]+)/)
    editor.selectToBufferPosition(beginning)
    editor.mutateSelectedText (selection) -> selection.deleteSelectedText()

atom.commands.add 'atom-text-editor',
  'user:debug', ->
    debugger

atom.commands.add 'atom-text-editor',
  'user:ipsj', ->
    mapping = {
      '、': '，',
      '。': '．',
    }

    editor = @getModel()
    editor.transact ->
      for k, v of mapping
        editor.scan(new RegExp(k, 'g'), ({ replace }) -> replace(v))
