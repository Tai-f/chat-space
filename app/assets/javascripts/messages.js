$(function(){

  var textField = $("#message_body");
  var messageUl = $(".chat-messages");

  function appendList(data){
    var dateElement = $('<p class = "chat-message__time">');
    var messageElement = $('<p class= "chat-message__body">');
    var listElement = $('<li class= "chat-message">');
    var headerElement = $('<div class = "chat-message__header clearfix">');
    var name = $('h5').text();
    var appendName = $('<p class= "chat-message__name">').append(name);
    var appendDate = dateElement.append(data.created_at);
    var appendMessage = messageElement.append(data.body);
    var appendHeader = headerElement.append(appendName).append(appendDate);
    var appendList = listElement.append(appendHeader).append(appendMessage);
    messageUl.prepend(appendList);
  }

  $("#new_message").submit(function(e){
    e.preventDefault();
    var input = textField.val();

    $.ajax({
      type: 'POST',
      url: './messages',
      data: {
        message: {
          body: input, image: ""
        }
      },
      dataType: "json"
    })
    .done(function(data){
      appendList(data);
      $("#submit").prop('disabled', false);
      textField.val("");
    })
    .fail(function(){
      alert("通信失敗しました")
    });
  });
});
