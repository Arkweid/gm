# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('body').on 'click', 'a.edit-char-link', (e) ->
    e.preventDefault();
    char_id = $(this).data('charId')
    $('form#edit-char-' + char_id).toggle()

$ ->
  $('body').on 'click', 'a.new-char-link', (e) ->
    e.preventDefault();
    $('form#new-char-form').toggle()