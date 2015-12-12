var regcheck;
$(window).load(function() {

    $("#registration").click(function(){
        regcheck=1;
        $("#send").val("Зареєструватися")

    })
    $("#enter").click(function(){
        regcheck=0;
        $("#send").val("Увійти")
    })
    $("#send").click(function(){
        if (regcheck){
        //$(".button_facebook_div")
        $(".main").text("���������")//.css('backgroundColor',"blue");;
        }
    })

})