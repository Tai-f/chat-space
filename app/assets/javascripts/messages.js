$(function(){

  var textField = $("#message_body");
  var messageUl = $(".chat-messages");

  function appendList(data){
    var dateElement = $('<p class = "chat-message__time">')
    var messageElement = $('<p class= "chat-message__body">')
    var listElement = $('<li class= "chat-message">')
    var name = $("<h5>").text();
    var appendName = $('<p class= "chat-message__name">').append(name);
    var appendDate = dateElement.append(data.created_at);
    var appendMessage = messageElement.append(data.body);
    var appendList = listElement.append(appendName).append(appendDate).append(appendMessage);
    messageUl.append(appendList)
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
    
  });
});
