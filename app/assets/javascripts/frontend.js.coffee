$(".switchForm li").each (i) ->
  i = i + 1
  $(this).click ->
    $(".switchForm li").removeClass "selected"
    $(".tabDetails").hide()
    $("#tabCont_" + i).show()
    $(this).addClass "selected"
    false