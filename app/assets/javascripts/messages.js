$(function(){

  var textField = $("#message_body");
  var messageUl = $(".chat-messages");
  var imageField = $("#message_image");

  function appendList(data){
    var name = $('h5').text();
    var appendName = $('<p class= "chat-message__name">').append(name);
    var appendDate = $('<p class = "chat-message__time">').append(data.created_at);
    var appendMessage = $('<p class= "chat-message__body">').append(data.body);
    var appendImage = $('<img class="chat-message__image">').append(data.image);
    var appendHeader = $('<div class = "chat-message__header clearfix">').append(appendName).append(appendDate);
    var appendList = $('<li class= "chat-message">').append(appendHeader).append(appendMessage).append(appendImage);
    messageUl.prepend(appendList);
  }

    $("#new_message").submit(function(){
      var formData = new FormData($(this)[0]);
      console.log(formData);
      // var input = textField.val();
      // var inputFile = imageField.prop("files")[0];
      // formData.append(textField.attr('name'), input);
      // formData.append(imageField.attr('name'),inputFile);
      $.ajax({
        type: 'POST',
        url: './messages',
        data: formData,
        processData: false,
        contentType: false,
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
