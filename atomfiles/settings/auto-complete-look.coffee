Promise = require 'bluebird'
{BufferedProcess} = require 'atom'
{provideService} = require './utils'

provideService 'autocomplete.provider', '2.0.0', ->
  selector: '*'
  inclusionPriority: 1
  suggestionPriority: 1
  getSuggestions: ({editor, BufferPosition, scopeDescriptor, prefix}) ->
    debugger
    new Promise (resolve) ->
      new BufferedProcess command: 'look', args: [prefix], stdout: (out) ->
        console.log("look out:", out)
        resolve(out.split("\n").map((el) -> text: el))
