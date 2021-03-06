# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

baseFunction = ->
  window.count = window.count + 1
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
    window.correct_count = window.correct_count + 1 if $(this).hasClass("bu")
    woman.choice()

refreshWomen = (stay_user_id) ->
  $.ajax
    type: "GET"
    data:
      stay_user_id: stay_user_id

    url: "/apis/change_women"
    success: (data) ->
      $('.womanPhotos').html(data); 
      baseFunction()  
    error: ->
      alert "error"
  
choiceFinish = (score) ->
  $.ajax
    type: "POST"
    data:
      score: score
    url: "/apis/create_score"
    success: (data, status) ->
      if data["result"] is true
        location.href = "http://localhost:3000/statistics"

    error: ->
      alert "error"

$ ->
  window.count = 0
  window.correct_count = 0
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
            if window.count >= 5
              choiceFinish(window.correct_count)
            else
              refreshWomen to_user_id 
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

    
