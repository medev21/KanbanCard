# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.ListSort').sortable()
  # $('.card').draggable()
  $( ".card" ).draggable({
  # containment: ".ListSort"
  });
  console.log('set up draggable')
  $('#test').droppable({
    drop: () ->
      console.log "dropped on #test"
  });
  $('.cardsort').droppable({
    accept: '.card'
    drop: (event, ui) ->
      console.log('drop')
      droppable = $(this)
      draggable = ui.draggable
      # draggable.appendTo(droppable)
      (draggable).detach().css({top: 0,left: 0}).appendTo(droppable)
      return
  })

  # $('.cardsort').droppable({
  #   tolerance: '.card'
  #   drop:(event, ui) ->
  #     console.log('drop')
  #     droppable = $(this).offset()
  #     draggable = ui.draggable.offset()
  #     left_end = droppable.left - draggable.left + 1
  #     top_end = droppable.top - draggable.top + 1
  #     ui.draggable.animate({
  #       top: '+=' + top_end,
  #       left: '+=' + left_end
  #     })
  #     return
  # })
