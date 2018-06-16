# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'dnd_stop.vakata', (e, data) ->
  ref = $('#tree').jstree(true)
  transfer_ids = data.data.nodes
  target_node = ref.get_node(event.toElement)
  target_node_id = if !target_node then "root" else target_node.id
  all_node_hash = data.data.origin._model.data
  transfer_nodes = []
  for node of all_node_hash
    transfer_nodes.push all_node_hash[node].id if transfer_ids.includes node
  console.log transfer_nodes.join(",")
  console.log target_node_id
  $.getScript("/categories/#{transfer_nodes.join(",")}/to/#{target_node_id}").done((script, textStatus) ->
    console.log textStatus
    console.log "transfered to #{target_node_id}"
    return
  ).fail (jqxhr, settings, exception) ->
    $('div.log').text 'Triggered ajaxError handler.'
    return

  return

$(document).on 'turbolinks:load', ->
  $('#tree').jstree 
    'core':
      'themes': 'name': 'default'
      "check_callback": true       
      'data':
        'url': '/categories.json'
        'data': (node) ->
          { 'id': node.id }
    'plugins': ['sort', 'types', 'dnd']     
    'sort': (a, b) ->
      a1 = @get_node(a)
      b1 = @get_node(b)
      if a1.icon == b1.icon
        if a1.order > b1.order then 1 else -1
      else
        if a1.icon > b1.icon then 1 else -1
  return