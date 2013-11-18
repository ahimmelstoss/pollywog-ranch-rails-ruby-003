// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function giveFly(){
  var fly_count = parseInt($('#flycountspan').html());
  var frog_id = parseInt($('#flycountspan').data('frogid'));
  var data = {"fly_count":fly_count, "frog_id":frog_id}
  $.post( '/frogs_give_fly', data, function(new_fly_count){
    console.log(new_fly_count);
    $('#flycountspan').html(new_fly_count.fly_count);
  })
}