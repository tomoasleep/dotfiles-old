Promise = require 'bluebird'
{BufferedProcess} = require 'atom'
{provideService} = require './utils'

provideService 'autocomplete.provider', '2.0.0',
  selector: '*'
  inclusionPriority: 0
  suggestionPriority: 0
  getSuggestions: ({editor, BufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      new BufferedProcess command: 'look', args: [prefix], stdout: (out) ->
        resolve(out.split("\n", 20).map((el) -> text: el))
