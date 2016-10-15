

$(document).ready(function(){


$(".deleteOption").keypress(function (e) {
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
               return false;
    }
   });



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
$('input[name="deleteOption"]').attr({placeholder: "enter the time of delete", id: "deletetime"});
  }
$("#select_result").show();
});



$("#sel1").on('change', function(){
  $("#signupSubmit").removeAttr('disabled');
});




 $('#msgsbm').validate({ 
        rules: {
            password: {
                required: true,
                minlength: 6
            },
            text: {
                required: true,
                minlength: 5
            },
            deleteOption: {
              
              digits: true,
              required: true
            }
        },
        submitHandler: function (form) { 

  var formURL = $(form).attr("action");
  var text = $('textarea[name="text"]').val();
  var password = $('input[name="password"]').val();
  encryptedData = CryptoJS.AES.encrypt(text, password).toString();
  var visit_limit = $('#visit_limit').val();
  var deletetime = $('#deletetime').val();


$.ajax({
    url: formURL,
    type: "POST",
    dataType: "json" ,
    data: {text: encryptedData, visit_limit: visit_limit, deletetime: deletetime},
    success: function(response) {
      $(".alert-success").show();
      $("#safe_link").val(document.URL + response.url);
    }
  });
        }
    });


	});