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
