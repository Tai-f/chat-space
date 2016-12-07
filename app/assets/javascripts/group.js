$(function(){

  var members = $("#user-search-result");


  function appendMembers(data){
    var nameElement = $('<p class="chat-group-user__name">').append(data.name);
    var userAttr = {user_id: data.id, user_name: data.name};
    var btnElement = $('<a class ="chat-group-user__btn chat-group-user__btn--add">').append("追加").attr(userAttr);
    var appendUser = $('<div class="chat-group-user clearFix">').append(nameElement).append(btnElement);
    members.append(appendUser);
  }


});
