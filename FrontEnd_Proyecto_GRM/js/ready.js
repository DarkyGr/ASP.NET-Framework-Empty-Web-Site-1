$(document).ready(function () {
    $("#liWeb").addClass("active");
    $(".contenedores").hide();
    $("#Web").show();
    $(".tipomenu").click(function () {
        $(".contenedores").hide();
        var nombre = $(this).data("identificador");
        $(".tipomenu").removeclass("active");
        $(this).addclass("active");
        $("#" + nombre).show();
    });

    //getGeo();
});