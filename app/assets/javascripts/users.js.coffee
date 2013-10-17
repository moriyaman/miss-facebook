# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $("#user_user_photo_attributes_photo").change () ->
    return  unless this.files.length # ファイル未選択
    $('#preview_field').html ""
    file = this.files[0]
    return  unless /^image\/(png|jpeg|gif)$/.test(file.type) # typeプロパティでMIMEタイプを参照
    img = document.createElement("img")
    fr = new FileReader()
    fr.onload = ->
      img.src = fr.result # 読み込んだ画像データをsrcにセット
      document.getElementById("preview_field").appendChild img

    fr.readAsDataURL file # 画像読み込み
  

