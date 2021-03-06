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
function ajaxAlertHandler(data, succ_cb, err_cb){
    try{
        if(typeof data.title != 'string')
            data.title = null;

        if(data.type == 'success'){
            succ_txt(data.text, data.title);

            if(typeof succ_cb == 'function')
                succ_cb();
        }else{
            if(data.type == 'error'){
                error_txt(data.text, data.title);
            }else{
                error();
            }
            if(typeof err_cb == 'function')
                err_cb();
        }
    }catch(e){
        error();
        if(typeof err_cb == 'function')
            err_cb();
    }
}

function error(){
    swal('Eroare', 'A apărut o eroare! Te rugăm să încerci din nou mai târziu.', 'error');
}
function error_txt(txt, title){
    if(typeof title != 'string')
        title = 'Eroare';
    swal(title, txt, 'error');
}
function succ_txt(txt, title){
    if(typeof title != 'string')
        title = 'Acțiune reușită!';
    swal(title, txt, 'success');
}
function reload(time, loc){
    if(typeof time == 'undefined')
        time = 1000;

    setTimeout(function(){
        if(typeof loc != 'undefined')
            window.location.href = loc;
        else
            window.location.reload();
    }, time);
}
