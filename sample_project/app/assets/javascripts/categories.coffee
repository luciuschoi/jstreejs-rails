# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#tree').jstree 
    'core':
      'themes': 'name': 'default-dark'
      "check_callback": true  
      'data':
        'url': '/categories.json'
        'data': (node) ->
          { 'id': node.id }
    'plugins' : ['sort', 'dnd']
    'sort': (a, b) ->
      a1 = @get_node(a)
      b1 = @get_node(b)
      if a1.icon == b1.icon
        if a1.text > b1.text then 1 else -1
      else
        if a1.icon > b1.icon then 1 else -1
  return