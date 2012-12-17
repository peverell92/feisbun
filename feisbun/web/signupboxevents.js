$(function(){
        $(".error").hide();
	$(".signupbox").on("click",function(){
            data = $(this).data("default");
            if(data == 1){
                $(this).attr("value","");
                $(this).data("default",0);
            }
	});
        $(".signup-form").on("submit",function(){
            if( $("#email").val() != $("#reemail").val() ){
                $(".emailmismatch").fadeIn();
                return false;
            }else{
                $(".emailmismatch").fadeOut();
            }
            if( ($("#username").data("default") == 1) || ($("#username").val() == "")){
                debugger
                $(".emptyfield").fadeIn();
                return false;
            }
            emailRegEx = /^[a-zA-Z][a-zA-Z0-9]*[.][a-zA-Z0-9]*@{1}feisbun[.]com/
            email = $("#email").val();
            if( !emailRegEx.test(email) ){
                $(".invalidemail").fadeIn();
                return false;
            }
        });
	$("#username").attr("value","Nombre completo");
	$("#email").attr("value","Tu email");
	$("#reemail").attr("value","Tu email de nuevo");
	$("#password").attr("value","Password");
	$("#phone").attr("value","Telefono");
	$("#address_street").attr("value","Calle");
	$("#address_colony").attr("value","Colonia");
	$("#address_city").attr("value","Ciudad");
	$("#address_state").attr("value","Estado");
	$("#school").attr("value","Escuela");
	$("#school-degree").attr("value","Titulo");
});