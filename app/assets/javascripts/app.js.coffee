$ ->
  # stop clicks on dummy links from putting a # at the end of the address bar
  $("a[href=#]").click ->
    false

  window.currentSnippet = (
    _cachedCSS: "",
    _reqTimeout: null,

    getHTML: ->
      $("#kiwi-html-source").val()
    ,
    getSCSS: ->
      $("#kiwi-scss-source").val()
    ,
    _getRenderedSource: ->
      "<style type='text/css'>#{this._cachedCSS}</style>#{this.getHTML()}"
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
    currentSnippet.refreshCSS()

