$(document).ready(function(){



//encryptedData = CryptoJS.AES.encrypt("test123", "123");
//alert(encryptedData);
//decryptedData = CryptoJS.AES.decrypt(encryptedData, "123");
//originalData = decryptedData.toString(CryptoJS.enc.Utf8);
//alert(originalData);
$("#msgsbm").submit(function(e)
{
	var formURL = $(this).attr("action");
	var name = $('textarea[name="name"]').val();
$.ajax({
   url: formURL,
   type: "POST",
   dataType: "json" ,
   //data: {_method: 'patch', user: { fullname: "Filip", phone: "9674041112" } },
   data: {name: name},
   success: function(response) {
    alert('ok');
   	$(".alert-success").show();
   	$("#safe_link").val(document.URL + response.url);
     //success: function(data, textStatus, jqXHR) {
    // alert(response.url); 
      //$( "#my4" ).append(response);
      //$(".edit_test").empty();
      //$('#cont').html(data);
   }
 });
e.preventDefault();
});
$("#ajaxform").submit();
	});