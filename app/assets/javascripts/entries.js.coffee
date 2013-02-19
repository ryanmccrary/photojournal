# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  new ImageCropper()

class ImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: .75
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#entry_crop_x').val(coords.x)
    $('#entry_crop_y').val(coords.y)
    $('#entry_crop_w').val(coords.w)
    $('#entry_crop_h').val(coords.h)