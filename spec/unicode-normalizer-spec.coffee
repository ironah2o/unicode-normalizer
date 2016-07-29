# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "UnicodeNormalizer", ->
  [activationPromise, editor, editorView] = []

  SAMPLE_TEXT = '①②③ \xC5\xFC\xF6\xE3 A\u030Au\u0308o\u0308a\u0303 CO\u2082 E=mc\u00B2 ⅠⅦⅫ ㌀㈱か\u3099がｸﾞ'
  # SAMPLE_TEXT = '①②③ Åüöã Åüöã CO₂ E=mc² ⅠⅦⅫ ㌀㈱ががｸﾞ'

  beforeEach ->
    waitsForPromise ->
      atom.workspace.open()
    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editorView = atom.views.getView(editor)
      activationPromise = atom.packages.activatePackage('unicode-normalizer')
      editor.setText(SAMPLE_TEXT)
      editor.selectAll()

  describe "when the unicode-normalizer:convert-to-NFC event is triggered", ->
    it "should convert all text to NFC format", ->
      atom.commands.dispatch editorView, 'unicode-normalizer:convert-to-NFC'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(editor.getText()).toBe('①②③ \xC5\xFC\xF6\xE3 \xC5\xFC\xF6\xE3 CO\u2082 E=mc\xB2 ⅠⅦⅫ ㌀㈱ががｸﾞ')

  describe "when the unicode-normalizer:convert-to-NFKC event is triggered", ->
    it "should convert all text to NFKC format", ->
      atom.commands.dispatch editorView, 'unicode-normalizer:convert-to-NFKC'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(editor.getText()).toBe('123 \xC5\xFC\xF6\xE3 \xC5\xFC\xF6\xE3 CO2 E=mc2 IVIIXII アパート(株)ががグ')

  describe "when the unicode-normalizer:convert-to-NFD event is triggered", ->
    it "should convert all text to NFD format", ->
      atom.commands.dispatch editorView, 'unicode-normalizer:convert-to-NFD'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(editor.getText()).toBe('①②③ A\u030Au\u0308o\u0308a\u0303 A\u030Au\u0308o\u0308a\u0303
         CO\u2082 E=mc\u00B2 ⅠⅦⅫ ㌀㈱か\u3099か\u3099ｸﾞ')

  describe "when the unicode-normalizer:convert-to-NFKD event is triggered", ->
    it "should convert all text to NFKD format", ->
      atom.commands.dispatch editorView, 'unicode-normalizer:convert-to-NFKD'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(editor.getText()).toBe('123 A\u030Au\u0308o\u0308a\u0303 A\u030Au\u0308o\u0308a\u0303
         CO2 E=mc2 IVIIXII アハ\u309Aート(株)か\u3099か\u3099ク\u3099')
