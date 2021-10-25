
$(document).ready(function(){
$("#login_button",).click(function (e) {
    e.preventDefault();
  var url =$(this).attr('href_url');
  let username=$('#username').val();
  let password=$('#password').val();
  let csrf=window.CSRF_TOKEN;

  mydata={username:username,password:password,csrf:csrf};

  if (username==""){
    console.log("Please enter old_password ")
  }else if(password==""){
    console.log("Please enter new_password ")
  }

if(username && password){
        data=mydata;
  }

    $.ajax({
      url: url,
      type: 'POST',
      data:data,
      success:function(data){ 
        console.log(data);
        if(data.status==true){
          window.location.href=data.url;
        }else if(data.status==false){
            $('#login_error').show();
            $('#login_error').text(data.msg)
        }
        },
      
   
  });
});
});
