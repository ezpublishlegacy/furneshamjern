
// perform JavaScript after the document is scriptable.

$(function(){
	$("ul.tabs").tabs(
		      "div.panes > div",
		      {history: true}
		    );
    curz = 999; 

    $("ul#nav> li").hover(function() {

      var timeout = $(this).data("timeout");

       if(timeout) clearTimeout(timeout);

         $(this).find("ul").slideDown(300).css({ 'z-index':curz++ });

       }, function() {

         $(this).data("timeout", setTimeout($.proxy(function() {

         $(this).find("ul").slideUp(300);

       }, this), 300));

     });
  });
