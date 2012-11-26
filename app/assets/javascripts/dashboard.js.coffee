# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
        $('.alert, .notice').delay(1000).fadeOut('slow')
        $('#debug_hide').on 'click', ->
            $('#debug').toggle()

$(document).on 'ready', ->
    $('.comments_header').on 'click', ->
        if $(@).html() == "View Comments" then $(@).html('Hide Comments') else $(@).html('View Comments')
        $('.dash_comments_div').toggle()

