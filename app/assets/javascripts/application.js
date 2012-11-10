// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.textchange
//= require bootstrap.min
//= require sass
//= require iframeAutoHeight
//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/javascript
//= require codemirror/modes/css
//= require codemirror/modes/htmlmixed
//= require app
//= require_self

$(function() {
 $(".kiwiboxCode").click(function(){
  $(this).removeClass("span4").addClass("span6");
 });

 WebFontConfig = {
    google: { families: [ 'Lato:400,700,400italic,700italic:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();
});