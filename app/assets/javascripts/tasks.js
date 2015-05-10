var add_history = function (task_id,token){
  $.ajax({
    type: "POST",
    url: "/task_histories",
    data: {
      "task_id": task_id,
      "authenticity_token": token ,
      "task_history[memo]":$("#task_history_memo").val(),
      "task_history[start_time(1i)]":$("#task_history_start_time_1i").val(),
      "task_history[start_time(2i)]":$("#task_history_start_time_2i").val(),
      "task_history[start_time(3i)]":$("#task_history_start_time_3i").val(),
      "task_history[start_time(4i)]":$("#task_history_start_time_4i").val(),
      "task_history[start_time(5i)]":$("#task_history_start_time_5i").val(),
      "task_history[end_time(1i)]":$("#task_history_end_time_1i").val(),
      "task_history[end_time(2i)]":$("#task_history_end_time_2i").val(),
      "task_history[end_time(3i)]":$("#task_history_end_time_3i").val(),
      "task_history[end_time(4i)]":$("#task_history_end_time_4i").val(),
      "task_history[end_time(5i)]":$("#task_history_end_time_5i").val()
      }
  }).done(function( data ) {
    $("#task_history_memo").val("");
    $("#task_history_area").html(data);
    var todays_date=new Date();
    $("#task_history_start_time_1i").val(todays_date.getFullYear());
    $("#task_history_start_time_2i").val(todays_date.getMonth()+1);
    $("#task_history_start_time_3i").val(todays_date.getDate());
    $("#task_history_start_time_4i").val(todays_date.getHours());
    $("#task_history_start_time_5i").val(todays_date.getMinutes());
    
    $("#task_history_end_time_1i").val(todays_date.getFullYear());
    $("#task_history_end_time_2i").val(todays_date.getMonth()+1);
    $("#task_history_end_time_3i").val(todays_date.getDate());
    $("#task_history_end_time_4i").val(todays_date.getHours());
    $("#task_history_end_time_5i").val(todays_date.getMinutes());
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
     "task_history[memo]":$("#task_history_text_"+history_id).val(),
      "task_history[start_time(1i)]":$("#task_history_start_time_history_"+history_id+"_1i").val(),
      "task_history[start_time(2i)]":$("#task_history_start_time_history_"+history_id+"_2i").val(),
      "task_history[start_time(3i)]":$("#task_history_start_time_history_"+history_id+"_3i").val(),
      "task_history[start_time(4i)]":$("#task_history_start_time_history_"+history_id+"_4i").val(),
      "task_history[start_time(5i)]":$("#task_history_start_time_history_"+history_id+"_5i").val(),
      "task_history[end_time(1i)]":$("#task_history_end_time_history_"+history_id+"_1i").val(),
      "task_history[end_time(2i)]":$("#task_history_end_time_history_"+history_id+"_2i").val(),
      "task_history[end_time(3i)]":$("#task_history_end_time_history_"+history_id+"_3i").val(),
      "task_history[end_time(4i)]":$("#task_history_end_time_history_"+history_id+"_4i").val(),
      "task_history[end_time(5i)]":$("#task_history_end_time_history_"+history_id+"_5i").val()}
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
