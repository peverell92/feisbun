$(function(){
    $(".emptybox-notif").hide()
    $(".postcomment").on("submit",function(){
        if($("#comment-textarea").val().length > 0){
            return true
        }else{
            $(".emptybox-notif").fadeIn()
            return false
        }
    })
});
