$(function(){

  var timer = 10000;

  var textField = $("#message_body");
  var messageUl = $(".chat-messages");
  var imageField = $("#message_image");

  function getList(){

    var currentLength = $(".chat-message").length;

    $.ajax({
      type: "GET",
      url: "./messages.json",
      dataType: "json"
    })

    .done(function(data){
      var dataLength = data.length;
      var newLength =(dataLength - currentLength);
      for (var i = 0; i < newLength; i++){
        appendList(data[i]);
      }
    })

    .fail(function(){
      console.log("取得できません");
    });
  }

  function appendList(data){

    var name = $('h5').text();
    var addList = '<li class = "chat-message">' +
                    '<div class = "chat-message__header  clearfix">' +
                      '<p class= "chat-message__name">' +
                        name +
                      '</p>' +
                      '<p class = "chat-message__time">'+
                        data.created_at +
                      '</p>' +
                    '</div>' +
                    '<p class= "chat-message__body">' +
                      data.body +
                    '</p>' +
                    '<img class="chat-message__image" src="'+ data.image.url +'">' +
                    '</img>' +
                  '</li>'
    messageUl.prepend(addList);

  }

  setInterval(getList, timer);

  $("#new_message").submit(function(e){
    e.preventDefault();
    var formData = new FormData($(this)[0]);
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
