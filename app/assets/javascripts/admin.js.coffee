# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document)
    .on 'ajax:before', ->
        $('#loading_div').show()
    .on 'ajax:complete', ->
        $('#loading_div').hide()
        $('.play_preview_button').on 'click', ->
            preview = $(@).closest('.video_preview')
            preview.css('background', 'black')
            preview.html($(@).attr("value"))

