$(function(){
	$('#username').focus().blur(checkName);
    //$('#username').blur(checkName);
	$('#password').blur(checkPassword);

    setTimeout(function() {
    	$("#actionerror").hide();
	}, 5000);

    $("#reset").click(function () {
        $('#count-msg').empty();
        $('#password-msg').empty();
    });


    // $(":input[name='Submit']").click(function () {
		// var theValue = $("#theTextOne").val();
		// if (theValue==""){
		// 	return true;
		// }else if(theValue!=null||theValue!=""){
    //        alert("用户名或密码错误!");
    //        $("#theTextOne").val("");
		// }
    // });
});

function checkName(){
	var name = $('#username').val();
	if(name == null || name == ""){
		//提示错误
		$('#count-msg').html("用户名不能为空");
        return false;
	}
	// var reg = /^\w{3,10}$/;
	// if(!reg.test(name)){
	// 	$('#count-msg').html("输入3-10个字母或数字或下划线");
	// 	return false;
	// }
	$('#count-msg').empty();
	return true;
}

function checkPassword(){
	var password = $('#password').val();
	if(password == null || password == ""){
		//提示错误
		$('#password-msg').html("密码不能为空");
		return false;
	}
	// var reg = /^\w{3,10}$/;
	// if(!reg.test(password)){
	// 	$('#password-msg').html("输入3-10个字母或数字或下划线");
	// 	return false;
	// }
	$('#password-msg').empty();
	return true;
}







