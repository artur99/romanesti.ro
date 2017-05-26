var tmp_map_get_magz_ajax = null;
function getAround(coords, size, callback){
    if(tmp_map_get_magz_ajax != null){
        tmp_map_get_magz_ajax.abort();
        tmp_map_get_magz_ajax = null
    }
    tmp_map_get_magz_ajax = $.post('/ajax/orase/gey_bycoord', {
        lat: coords.lat,
        lng: coords.lng,
        size: size,
        csrftoken: csrftoken
    }, function(data){
        tmp_map_get_magz_ajax = null;
        if(typeof data.results != 'undefined')
            callback(data.results);
    })
}
function getAround2(borders, callback){
    if(tmp_map_get_magz_ajax != null){
        tmp_map_get_magz_ajax.abort();
        tmp_map_get_magz_ajax = null
    }
    borders.csrftoken = csrftoken;
    tmp_map_get_magz_ajax = $.post('/ajax/orase/gey_bycoord', borders, function(data){
        tmp_map_get_magz_ajax = null;
        if(typeof data.results != 'undefined')
            callback(data.results);
    })
}
function initMapForCity() {
    var markers = [];
    var marker, geocoder, map, service;
    var cityCoord = {lat: glob_lat, lng: glob_lng};
    var image_marker_1 = '/assets/img/ui/pin1_s.png';
    var image_marker_2 = '/assets/img/ui/pin2_s.png';
    var pin1 = {url: image_marker_1, scaledSize: new google.maps.Size(45, 45)};
    var pin2 = {url: image_marker_2, scaledSize: new google.maps.Size(35, 35)};

    function init(){
        map = new google.maps.Map(document.getElementById('mainMap'), {
          zoom: 14,
          center: cityCoord,
          maxZoom: 17,
          minZoom: 12,
          scrollwheel: false
        });
        service = new google.maps.places.PlacesService(map);

        google.maps.event.addListener(map, 'bounds_changed', setShopMarkers);

        // map.addListener('click', function(e) {
        //     console.log(e);
        //     marker.setMap(null);
        //     marker = new google.maps.Marker({
        //         position: e.latLng,
        //         map: map
        //     });
        //     if(typeof e.placeId != 'undefined'){
        //         getPlaceInfo(e.placeId, function(data){
        //           console.log(data);
        //         });
        //     }
        //     map.panTo(e.latLng);
        // });
    }
    function popupHtmlGen(data){
        var html = '';
        html+= '<div class="mappopupin">';
        html+= '<div class="heading">';
            html+= '<i class="flag '+data.nat_detinator+'"></i> ';
            html+= '<b>'+data.nume+'</b><br>';
        html+= '</div>';
        if(data.romanesc == 1){
            html+= '<span class="badge green">Magazin românesc</span><br>';
        }else{
            html+= '<span class="badge red">Magazin străin</span><br>';
        }
        html+= '<div class="links">'
            html+= '<a target="_blank" href="https://www.google.com/maps/?q='+data.coord_lat+','+data.coord_lng+'">Indicații de orientare</a><br>';
            if($("body").find(".card[data-id='"+data.id+"']").length > 0)
            html+= '<a href="#" data-linkid="'+data.id+'" class="gotoid">Detalii</a><br>';
        html+= '</div>';
        html+= '</div>';

        return html;
    }
    function setShopMarkers(){
        var mb = map.getBounds();
        getAround2({
            lat_l: mb.f.b,
            lat_r: mb.f.f,
            lng_l: mb.b.b,
            lng_r: mb.b.f
        }, function(data){
            for(var i=0; i<markers.length;i++){
                if(typeof markers[i] != 'undefined')
                    markers[i].setMap(null);
            }
            markers = [];
            for(var i=0; i<data.length; i++){

                markers[i] = new google.maps.Marker({
                    position: {
                        lat: parseFloat(data[i].coord_lat),
                        lng: parseFloat(data[i].coord_lng),
                    },
                    map: map,
                    title: data[i].nume,
                    html: popupHtmlGen(data[i]),
                    icon: parseInt(data[i].romanesc)?pin1:pin2
                });
                var infowindow = new google.maps.InfoWindow({
                    content: "..."
                });
                var tmp_mark = markers[i];
                google.maps.event.addListener(tmp_mark, 'click', function () {
                    infowindow.setContent(this.html);
                    infowindow.open(map, this);
                });
                // (function(dtdt){
                //     tmp_mrk.addListener('click', function() {
                //         console.log('in', this);
                //         new google.maps.InfoWindow({
                //             content: '<b>'+dtdt.nume+'</b>'
                //         })
                //         win.open(map, tmp_mrk);
                //     });
                // })(data[i]);
                // markers[i] = tmp_mrk;
                // console.log('out', markers[i]);
            }
        });

    }
    $(document).on('click', '.gotoid', function(e){
        e.preventDefault();
        $(".card").removeClass("hilighted");
        var idval = $(this).data('linkid');
        var el = $("body").find(".card[data-id='"+idval+"']");
        var el_off = el.offset().top;
        var el_h = el.height();
        var winh = $(window).height();
        var offset;

        if (el_h < winh) {
            offset = el_off - ((winh / 2) - (el_h / 2));
        }
        else {
            offset = el_off;
        }
        $('html, body').animate({scrollTop:offset}, 500);
        setTimeout(function(){
            el.addClass('hilighted');
        })
    })



    init();
}
