function initContOut(){
    var ajax1_running = ajax2_running = 0;
    $(document).on('submit', '#form_signup', function(e){
        e.preventDefault();
        if(ajax1_running) return;
        var data = formGetter($(this));
        data.csrftoken = csrftoken;
        ajax1_running = 1;
        $.ajax({
            method: 'POST',
            url: '/ajax/cont/signup',
            data: data
        }).done(function(resp){
            ajax1_running = 0;
            try{
                if(resp.type == 'success'){
                    succ_txt(resp.text);
                    reload(1500);
                }else if(resp.type == 'error'){
                    error_txt(resp.text);
                }else{
                    error();
                }
            }catch(e){
                error();
            }
        }).fail(function(){
            ajax1_running = 0;
            error();
        });
    });
    $(document).on('submit', '#form_login', function(e){
        e.preventDefault();
        if(ajax2_running) return;
        var data = formGetter($(this));
        data.csrftoken = csrftoken;
        ajax2_running = 1;
        $.ajax({
            method: 'POST',
            url: '/ajax/cont/login',
            data: data
        }).done(function(resp){
            ajax2_running = 0;
            try{
                if(resp.type == 'success'){
                    succ_txt(resp.text);
                    reload(1500);
                }else if(resp.type == 'error'){
                    error_txt(resp.text);
                }else{
                    error();
                }
            }catch(e){
                error();
            }
        }).fail(function(){
            ajax2_running = 0;
            error();
        });
    });
    $(document).on('click', '.logout-button', function(e){
        e.preventDefault();
        data = {csrftoken: csrftoken};
        $.ajax({
            method: 'POST',
            url: '/ajax/cont/signout',
            data: data
        }).done(function(resp){
            ajax2_running = 0;
            reload(10, '/cont');
        }).fail(function(){
            reload(10, '/cont');
        });
    });
    $(document).on('submit', '#form_addmagaz', function(e){
        e.preventDefault();
        if(ajax1_running) return;
        var data = formGetter($(this));
        var that = this;
        data.csrftoken = csrftoken;
        ajax2_running = 1;
        $.ajax({
            method: 'POST',
            url: '/ajax/cont/add_magaz_fizic',
            data: data
        }).done(function(resp){
            ajax2_running = 0;
            try{
                if(resp.type == 'success'){
                    succ_txt(resp.text);
                    clearFormOfData($(that));
                }else if(resp.type == 'error'){
                    error_txt(resp.text);
                }else{
                    error();
                }
            }catch(e){
                error();
            }
        }).fail(function(){
            ajax2_running = 0;
            error();
        });
    });

    $(document).on('click', '.action_transcript', function(e){
        e.preventDefault();
        var dataid = $(this).closest(".listi").data('id');
        var data = suggestions1[dataid];
        loadFormWithData('#form_addmagaz', data);
    });
    $(document).on('click', '.action_done', function(e){
        e.preventDefault();
        delordone_magazfiz(this, 'done');
    });
    $(document).on('click', '.action_delete', function(e){
        e.preventDefault();
        delordone_magazfiz(this, 'del');
    });
    function delordone_magazfiz(that, type){
        //type - del/done
        var dataid = $(that).closest(".listi").data('id');
        var this2 = $(that);
        var data = {
            id: dataid,
            csrftoken: csrftoken
        }
        $.ajax({
            method: 'POST',
            url: ('/ajax/cont/set_magaz_fizic_'+type),
            data: data
        }).done(function(resp){
            try{
                if(resp.type == 'success'){
                    succ_txt(resp.text);
                    $(this2).closest(".listi").slideUp(function(){
                        $(this).remove();
                    });
                }else{
                    error();
                }
            }catch(e){
                error();
            }
        }).fail(function(){
            error();
        });
    }

    function error(){
        swal('Eroare', 'A apărut o eroare! Te rugăm să încerci din nou mai târziu.', 'error');
    }
    function error_txt(txt){
        swal('Eroare', txt, 'error');
    }
    function succ_txt(txt){
        swal('Acțiune reușită!', txt, 'success');
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
}


function initContMap(){
    var marker, geocoder, map, service;
    var roCoord = {lat: 46.1646144968971, lng: 24.824981689453125};

    function init(){
        map = new google.maps.Map(document.getElementById('mapCont'), {
          zoom: 7,
          center: roCoord,
          scrollwheel: true
        });
        service = new google.maps.places.PlacesService(map);

        map.addListener('click', function(e) {
            console.log(e);
            if(typeof marker != 'undefined')
                marker.setMap(null);
            marker = new google.maps.Marker({
                position: e.latLng,
                map: map
            });
            map.panTo(e.latLng);
            $("#injLatHere").val(e.latLng.lat);
            $("#injLngHere").val(e.latLng.lng);
        });



        $(document).on('click', '.action_transcript', function(e){
            e.preventDefault();
            var data = suggestions1[$(this).closest(".listi").data('id')];
            var newLatLng = {
                lat: data.lat,
                lng: data.lng
            };
            if(typeof marker != 'undefined')
                marker.setMap(null);
            marker = new google.maps.Marker({
                position: newLatLng,
                map: map
            });
            map.panTo(newLatLng);
            map.setZoom(15);
        })
    }

    init();
}
