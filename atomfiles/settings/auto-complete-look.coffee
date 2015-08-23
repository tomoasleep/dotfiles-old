Promise = require 'bluebird'
{BufferedProcess} = require 'atom'
{provideService} = require './utils'

type = 'Look'
label = 'look'
provideService 'autocomplete.provider', '2.0.0',
  selector: '*'
  inclusionPriority: 0
  suggestionPriority: 0
  getSuggestions: ({prefix}) ->
    new Promise (resolve) ->
      new BufferedProcess command: 'look', args: [prefix], stdout: (out) ->
        resolve(out.split("\n").map((el) -> text: el, type: type, rightLabel: label))
