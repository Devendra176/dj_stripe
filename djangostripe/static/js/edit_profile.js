$(document).ready(function(){
$("#save_profile",).click(function (e) {
    e.preventDefault();
  var url =$(this).attr('href_url');
  let cus_id=$('#cus_id').val();
  let PaymentMethod_id=$('#PaymentMethod_id').val();
  let card_email=$('#card_email').val();
  let phone=$('#phone').val();
  let old_password=$('#old_password').val();
  let new_password=$('#new_password').val();
  let csrf=window.CSRF_TOKEN;

  mydata={cus_id:cus_id,PaymentMethod_id:PaymentMethod_id,csrf:csrf,card_email:card_email,phone:phone}
  my_data={cus_id:cus_id,PaymentMethod_id:PaymentMethod_id,csrf:csrf,card_email:card_email,phone:phone,old_password:old_password,new_password:new_password}
if(old_password && new_password){
  if (old_password==""){
    // $("#errorprofesion").text("Please enter profesion ");
    console.log("Please enter old_password ")
  }else if(new_password==""){
    console.log("Please enter new_password ")
  }}

if(old_password && new_password){
        data=my_data;
  }else{
    data=mydata;
  }

    $.ajax({
      url: url,
      type: 'POST',
      data:data,
      success:function(data){ 
        if (data.status==true){
          window.location.reload(true);
            }else if(data.status==false){
                window.location.reload(true);
            }else{
              console.log(" sever failed  ")
            }
          },
        });
      
   
  });
});
