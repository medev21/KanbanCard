// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require turbolinks
//= require_tree .

var do_on_load = function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

  // sortables
  // make div col-lg-10 a sortable, call class list-sortable
  $( ".list-sortable" ).sortable({
    cancel: '.listA, .listB, .list-form-grid'  //exclude these classes from being sorted
  }).disableSelection();

  ///////end of sortables////////////


  ////// drag and drop////////

  $(".listA").sortable({
    cancel: 'header', //this exclude the header tag from being sorted!
    connectWith: ".listB", //connect with the other sortable function
    helper: "",
    revert: "invalid",
    // forcePlaceholderSize: true,
    start: function (event, ui) {
        var $item = ui.helper;
        $item.css({
          'width': $('.card').width(),
        });
        ui.placeholder.height(ui.item.height()); //placeholder full height
    },
    stop: function (event, ui) {}
  });

  $(".listB").sortable({
    placeholder: "ui-state-highlight",
    connectWith :'.listA',  //connect with the other sortable function
    revert: true,
    cursor: "move",
    items: ".card",
    drop: function (event, ui) {

    },
    stop: function (event, ui) {
        var $obj = $(ui.item);
        //
        }
  });
}
$(document).ready(do_on_load)
$(window).bind('page:change', do_on_load)
