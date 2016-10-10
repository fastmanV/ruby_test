
$(document).ready(function(){

    var clipboard = new Clipboard('.btn');

    clipboard.on('success', function(e) {
        console.log(e);
    });

    clipboard.on('error', function(e) {
        console.log(e);
    });

$( ".target" ).change(function() {


  if ($(this).val() == 1){
$('input[name="deleteOption"]').attr({placeholder: "enter visit limit", id: "visit_limit"});

  }else{
$('input[name="deleteOption"]').attr({placeholder: "enter delete time", id: "deletetime"});
  }


 
$("#select_result").show();

});

//encryptedData = CryptoJS.AES.encrypt(text2, "123");
//decryptedData = CryptoJS.AES.decrypt(encryptedData, "123");
//originalData = decryptedData.toString(CryptoJS.enc.Utf8);
//alert(originalData);

$("#msgsbm").submit(function(e)
{


	var formURL = $(this).attr("action");
	var text = $('textarea[name="text"]').val();
  var password = $('input[name="password"]').val();
  encryptedData = CryptoJS.AES.encrypt(text, password).toString();
  var visit_limit = $('#visit_limit').val();
  var deletetime = $('#deletetime').val();

$.ajax({
   url: formURL,
   type: "POST",
   dataType: "json" ,
   //data: {_method: 'patch', user: { fullname: "Filip", phone: "9674041112" } },
   data: {text: encryptedData, visit_limit: visit_limit, deletetime: deletetime},
   success: function(response) {
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