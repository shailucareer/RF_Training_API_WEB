function fillForm(v1, v2, v3, v4){
    document.getElementById("fullName").value = v1;
    document.getElementById("join").value = v2;
    document.getElementById("noEdit").value = v3;
    document.getElementById("dontwrite").value = v4;
}

fillForm(arguments[0],arguments[1],arguments[2],arguments[3]);
