{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  commands:
    'convert-to-NFC'    : ["NFC"]
    'convert-to-NFKC'  : ["NFKC"]
    'convert-to-NFD'  : ["NFD"]
    'convert-to-NFKD': ["NFKD"]

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    for command, args of @commands
      @subscriptions.add atom.commands.add 'atom-text-editor', "unicode-normalizer:#{command}", @convert.bind(this, args)

  deactivate: ->
    console.log ("deactivate")
    @subscriptions?.dispose()
    @subscriptions = null

  convert: (args) ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?
    selectedText = editor.getSelectedText()
    return unless selectedText.length > 0
    unorm = require 'unorm' unless unorm?
    convertedText = switch args[0]
      when "NFC"
        unorm.nfc(selectedText)
      when "NFKC"
        unorm.nfkc(selectedText)
      when "NFD"
        unorm.nfd(selectedText)
      when "NFKD"
        unorm.nfkd(selectedText)
    editor.insertText(convertedText)
