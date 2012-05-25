class window.Sass
  @compile: (scss, doneCallback) ->
    $.post "/sass/compile.json", (scss: scss), (data) ->
      doneCallback data

