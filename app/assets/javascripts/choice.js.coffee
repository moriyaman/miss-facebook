# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

baseFunction = ->
  women = []
  $(".woman").each ->
    _self = $(this)
    user_id = $(this).attr("data-id")
    woman = new Woman(_self, user_id)
    woman.create_impression();
    women.push woman

  $(".woman").click ->
    index = $(".woman").index($(this))
    woman = women[index]
    woman.choice()

refreshWoman = (stay_user_id) ->
  $.ajax
    type: "POST"
    data:
      stay_user_id: stay_user_id

    url: "/apis/ch_woman/"
    success: (data, status) ->
      if data["result"] is true
        unless success_func is `undefined`
          $ success_func
        else
          alert "ok"
      else
        alert "error"

    error: ->
      alert "error"




$ ->
  baseFunction()

#下記は必要無いはず

Woman = (_self, id) ->
  @dom = _self
  @id = id

Woman:: =
  choice: (success_func, failed_func) ->
    to_user_id = @id
    $.ajax
      type: "POST"
      data:
        to_user_id: to_user_id

      url: "/apis/choice_woman/"
      success: (data, status) ->
        if data["result"] is true
          unless success_func is `undefined`
            $ success_func
          else
            alert "ok"
        else
          alert "error"

      error: ->
        alert "error"


  create_impression: ->
    user_id = @id
    $.ajax
      type: "POST"
      data:
        user_id: user_id

      url: "/apis/create_user_impression/"
      success: (data, status) ->
  
  change: (success_func, failed_func) ->
    
