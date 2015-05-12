
{ observeGrammar, buildEvent } = require './utils'

observeGrammar /HTML/, ->
  view = atom.views.getView(this)
  # process.nextTick(-> view.dispatchEvent(buildEvent('atom-html-preview:toggle'))) if view
  console.log('toggle html preview', @getPath())
