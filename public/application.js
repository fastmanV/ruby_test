$(document).ready(function(){

encryptedData = CryptoJS.AES.encrypt("test123", "123");
alert(encryptedData);
decryptedData = CryptoJS.AES.decrypt(encryptedData, "123");
originalData = decryptedData.toString(CryptoJS.enc.Utf8);
alert(originalData);

	});