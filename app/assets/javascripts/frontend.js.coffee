$(document).ready ->
	$(".switchForm li").each (i) ->
	  i = i + 1
	  $(this).click ->
	    $(".switchForm li").removeClass "selected"
	    $(".tabDetails").hide()
	    $("#tabCont_" + i).show()
	    $(this).addClass "selected"
	    false

# $(".addButton .addMore").live "click", ->
#   $("<div class=\"addButton newAdded\"><input type =\"text\" placeholder=\"Option 3\"><div class=\"clearfix\"><button class=\"small button alert right removeThis\" title = \"Remove This\">&dash;</button><button class=\"small button success right addMore\" title =\"Add More\">+</button></div></div>\n").appendTo ".addHere"
#   $(this).siblings().remove()
#   $(this).remove()
# $(".addButton .removeThis").live "click", ->
#   $('<div class=\"clearfix\"><button class=\"small button success right addMore\" title =\"Add More\">+</button></div>').appendTo ".addButton"
#   $(this).parents('.newAdded').remove();
#   $(this).remove()