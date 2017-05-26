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
