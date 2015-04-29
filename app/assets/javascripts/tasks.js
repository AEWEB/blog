var add_history = function (task_id,token){
  $.ajax({
    type: "POST",
    url: "/task_histories",
    data: {
      "task_id": task_id,
      "authenticity_token": token ,
      "task_history[memo]":$("#task_history_memo").val()}
  }).done(function( data ) {
    $("#task_history_memo").val("");
    $("#task_history_area").html(data);
  });
}
var edit_history = function (history_id){
  $("#task_history_textarea_"+history_id).show();
  $("#task_history_memo_"+history_id).hide();
}
var update_history = function (history_id){
  $.ajax({
    type: "PUT",
    url: "/task_histories/"+history_id,
    data: {"authenticity_token": $("#page_token").val(),
      "task_history[memo]":$("#task_history_text_"+history_id).val()}
   }).done(function( data ) {
     $("#task_history_area").html(data);
  });
}
var delete_history = function (history_id){
  $.ajax({
    type: "DELETE",
    url: "/task_histories/"+history_id,
    data: {"authenticity_token": $("#page_token").val()}
   }).done(function( data ) {
   	$("#task_history_area").html(data);
  });
}
