$ ->
  updatePreview = ->
    previewFrame = document.getElementById("preview")
    preview = previewFrame.contentDocument or previewFrame.contentWindow.document
    preview.open()
    preview.write htmleditor.getValue()
    cssValue = csseditor.getValue()
    jsValue = jseditor.getValue()
    val = "<scr" + "ipt>" + jsValue + "</scr" + "ipt>"
    preview.write val
    $("#preview").contents().find("head").append("<style>" + cssValue + "</style>");
    preview.close()
  delay = undefined
  htmleditor = CodeMirror.fromTextArea(document.getElementById("kiwi-html-source"),
    lineNumbers: true
    mode: "text/html"
    tabMode: "indent"
    onChange: ->
      clearTimeout delay
      delay = setTimeout(updatePreview, 300)
  )
  csseditor = CodeMirror.fromTextArea(document.getElementById("kiwi-scss-source"), 
    lineNumbers: true
    mode: "text/css"
    tabMode: "indent"
    onChange: ->
      clearTimeout delay
      delay = setTimeout(updatePreview, 300)
  )
  jseditor = CodeMirror.fromTextArea(document.getElementById("kiwi-js-source"),
    lineNumbers: true
    mode: "text/javascript"
    tabMode: "indent"
    onChange: ->
      clearTimeout delay
      delay = setTimeout(updatePreview, 300)
  )
  setTimeout updatePreview, 300
  
  $("#preview").iframeAutoHeight();

  $("input.kiwifocus").each ->
    if $(this).val() == ""
      $(this).focus()

  window.currentSnippet = (
    _cachedCSS: "",
    _reqTimeout: null,

    getHTML: ->
      $("#kiwi-html-source").val()
    ,
    getSCSS: ->
      $("#kiwi-scss-source").val()
    ,
    getJS: ->
      $("#kiwi-js-source").val()

    _getRenderedSource: ->
      "<style type='text/css'>#{this._cachedCSS}</style><script>#{this.getJS()}</script>#{this.getHTML()}"
    ,
    refreshCSS: ->
      clearTimeout this._reqTimeout
      this._reqTimeout = setTimeout =>
        Sass.compile this.getSCSS(), (data) =>
          if data.css != null
            this._cachedCSS = data.css
          this.renderSource()
      , 400
    ,
    renderSource: ->
      $("#kiwi-rendered-source").html this._getRenderedSource()
  )

  $("#kiwi-html-source").bind "textchange", ->
    currentSnippet.renderSource()

  $("#kiwi-scss-source").bind "textchange", ->
    currentSnippet.refreshCSS()

  if $("#kiwi-html-source").length > 0
    currentSnippet.renderSource()
    currentSnippet.refreshCSS()