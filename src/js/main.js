function formGetter(form){
    form = $(form);

    var disabled = form.find('input:disabled').removeAttr('disabled');
    var obj1 = form.serializeArray();
    disabled.attr('disabled','disabled');

    var obj2 = {};
    for(var i=0;i<obj1.length;i++){
        obj2[obj1[i].name] = obj1[i].value;
    }
    return obj2;
}
function loadFormWithData(form, data){
    clearFormOfData(form);
    form = $(form);
    for(var key in data){
        $(form).find('input[name='+key+']:not([type=submit])').val(data[key]);
        $(form).find('textarea[name='+key+']').html(data[key]);
        $(form).find('select[name='+key+']').val(data[key]);
    }
    return true;
}
function clearFormOfData(form){
    form = $(form);
    $(form).find("input:not([type=submit])").val("");
    $(form).find("select").val("");
    $(form).find("textarea").html("");
}
