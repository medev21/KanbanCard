# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.ListSort').sortable()
  $('.card').draggable()
  console.log('set up draggable')
  $('#test').droppable({
    drop: () ->
      console.log "dropped on #test"
  });
  $('.cardsort').droppable({
    accept: '.card'
    # activeClass: 'ui-state-hover'
    # hoverClass: 'ui-state-active'
    drop: (event, ui) ->
      console.log('drop')
      droppable = $(this)
      draggable = ui.draggable
      draggable.appendTo(droppable)
      # draggable.css ->
      #   top: '0px'
      #   left: '0px'
      return
  })
# jQuery ->
  # $('.cardsort').dropable()
