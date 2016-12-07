$(function(){

  var members = $("#user-search-result");
  var preWord;

  function appendMembers(data){
    var nameElement = $('<p class="chat-group-user__name">').append(data.name);
    var userAttr = {user_id: data.id, user_name: data.name};
    var btnElement = $('<a class ="chat-group-user__btn chat-group-user__btn--add">').append("追加").attr(userAttr);
    var appendUser = $('<div class="chat-group-user clearFix">').append(nameElement).append(btnElement);
    members.append(appendUser);
  }

  function editElement(element){
    var result = "^" + element;
    return result;
  }

  $("#user-search-field").on("keyup", function(){
    var input = $(this).val();
    var inputs = input.split(" ").filter(function(e){ return e;});
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    var reg = RegExp(word);

    $.ajax({
      type: "GET",
      url: "/users.json",
      data:{},
      dataType: "json"
    })

    .done(function(data){
      if(word != preWord && input.length !== 0){
        members.children().remove();
        $.each(data, function(i, a_data){
          var userName = a_data.name
          if(userName.match(reg)){
            appendMembers(a_data);

            $(".chat-group-user__btn.chat-group-user__btn--add").on("click", function(){
              var userId = $(this).attr("user_id");
              var userName = $(this).attr("user_name");
              var appendUserName = $('<p class="chat-group-add-user__name">').append(userName).attr("id", userId);
              var removeBtn = $('<a class ="chat-group-user__btn chat-group-user__btn--remove">').append("削除");
              var showUser = $('<div class="chat-group-user clearFix">').append(appendUserName).append(removeBtn);
              $("#chat-group-users").append(showUser);
              $(".chat-group-user__btn.chat-group-user__btn--remove").click(function(){
                $(this).parent().remove();
              });
            });
          }
        });
      }
    preWord = word;
    })

    .fail(function(){
      alert("通信されていません");
    });

  });

  $("#new_group").on("submit", function(){
    var ids =[]
    var input = $(".chat-group-form__input").val();
    var find_ids = $(".chat-group-user").children(".chat-group-add-user__name");
    $.each(find_ids, function(i, find_id){
      ids.push(this.id);
    });
    var saveIds = {value: ids};
    $(".chat-group-form_hidden").attr(saveIds);

    $.ajax({
      type: 'POST',
      url: '/groups',
      data: {
        group: {
          name: input, user_ids: ids
        }
      },
      dataType: "json"
    })

    .done(function(){
    })

    .fail(function(){
      alert("通信失敗しました")
    });
  });

});
