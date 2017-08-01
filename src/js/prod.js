$(document).ready(function(){
    if($("#search_prod_form").length + $("#search_barcode_form").length > 0){
        search_prod_resolver();
    }
});

function search_prod_resolver(){
    // $('#search_oras_input').autocomplete({
    //     serviceUrl: '/ajax/orase/search',
    //     type: 'POST',
    //     paramName: 'q',
    //     params: {
    //         csrftoken: csrftoken
    //     },
    //     minChars: 2,
    //     transformResult: function(response, originalQuery) {
    //         if(typeof response != 'object')
    //             response = JSON.parse(response);
    //         return {
    //             suggestions: $.map(response.results, function(itm) {
    //                 return {value: itm.name, data: itm.slug };
    //             })
    //         };
    //     },
    //     onSelect: function (result) {
    //         loadCity(result.value, result.data);
    //     },
    //     onSearchComplete: function (query, suggestions) {
    //         latest_suggestions = suggestions;
    //     }
    // });
    $(document).on('submit', '#search_barcode_form', function(e){
        e.preventDefault();
        var code = $('#search_barcode_input').val().trim();
        if(code.length == 0) return;

        showBarcodeAlert(code);
    })
    $(document).on('submit', '#search_oras_form', function(e){
        e.preventDefault();
        if(
            latest_suggestions != null &&
            (typeof latest_suggestions == 'array' ||
            typeof latest_suggestions == 'object') &&
            typeof latest_suggestions[0] != 'undefined' &&
            typeof latest_suggestions[0].data == 'string' &&
            latest_suggestions[0].data.trim().length > 0
        ){
            return loadCity(latest_suggestions[0].value, latest_suggestions[0].data);
        }else{
            findCity(function(data){
                loadCity(data[0].name, data[0].slug);
            });
        }
    })
}
function findCity(callback){
    var val = $("#search_oras_input").val().trim();
    if(val.length < 2) return;
    $.post('/ajax/orase/search', {
        q: val,
        csrftoken: csrftoken
    }, function(data){
        if(typeof data.results != 'undefined')
            callback(data.results);
    })
}
function showBarcodeAlert(code){
    $.post('/ajax/prod/check_barcode', {
        code: code,
        csrftoken: csrftoken
    }, function(data){
        ajaxAlertHandler(data);
    })
}
