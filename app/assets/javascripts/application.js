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
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){

  $("#btn-load-tweets").click(function(){
    $.get("tweets/mentions", 
        { max_id: readCookie("max_id")}, 
          function(data){
            $("#tweet-mentions").append(data);
          }, "html");
  });

   $(document).on('keyup', ".tweet-message", function(elem){
    $(this).next('.nb-character').text(140 - $(this).val().length);
  }); 

  $(document).on('click', "button.btn-reply", function(elem){
    $(this).next("div.reply-box").show();
  });
  
  $(document).on('click', ".reply-box .send-tweet-reply", function(elem){
    $(this).closest("div.reply-box").hide();
  });

 
  function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
      var c = ca[i];
      while (c.charAt(0)==' ') c = c.substring(1,c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
  }

});

