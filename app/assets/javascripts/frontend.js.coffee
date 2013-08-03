$(".switchForm li a").each (i) ->
  i = i + 1
  $(this).click ->
    $(".switchForm li").removeClass "selected"
    $(".tabDetails").hide()
    $("#tabCont_" + i).show()
    $(this).parent().addClass "selected"
    false