function getGeo() {
    // Verificar si esta activa la geolocalizacion
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(geoOK, geoKO);
    }
}

function geoOK(position) {
    console.log(position);
    showLatLong(position.coords.latitude, position.coords.longitude);
    dibujaMapa(position.coords.latitude, position.coords.longitude);
}

function geoKO(err) {
    if (err.code == 1) {
        console.log("El usuario nego el permiso");
    } else if (err.code == 2) {
        console.log("No se puede determinar la ubicacion");
    } else if (err.code == 3) {
        console.log("Tiempo de respuesta EXPERIDAD");
    } else {
        error('Error ' + err.code);
    }
}
function showLatLong(lat, long) {
    $("#direccion").html("Latitud: " + lat + " --- Longitud: " + long);
    var geocoder = new google.maps.Geocoder();
    var milocalizacion = new google.maps.LatLng(lat, long);
    geocoder.geocode({ 'latLng': milocalizacion }, processGeocoder);
    //dibujaMapa(lat, long);
    //initMap(lat, long);
}

function error(error) {
    alert(error);
}

function processGeocoder(result, status) {
    console.log(result);
    console.log(status);

    if (status == google.maps.GeocoderStatus.OK) {
        if (result[0]) {
            var direccion = result[0].formatted_address;
            $("#direccion").html(direccion);
        } else {
            error("Google no retorno ningun resultado");
        }
    } else {
        error("Google no retorno ningun resultado");
    }
}

function dibujaMapa(lat, long) {
    var coordenadas = { Lat: 0, Lng: 0 };

    function localizacion(posicion) {
        if (lat == 0) {
            coordenadas = {
                Lat: posicion.coords.latitude,
                Lng: posicion.coords.longitude,
            }
        } else {
            coordenadas = {
                Lat: lat,
                Lng: long,
            }
        }

        // Dibujar mapa
        var misCoordenadas = new google.maps.LatLng(coordenadas.Lat, coordenadas.Lng);
        var mapOptions = {
            zoom: 16,
            center: misCoordenadas,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        //Cargamos mapa
        var map = new google.maps.Map(document.getElementById('mapa'), mapOptions);

        // Marker
        var marker = new google.maps.Marker({
            position: misCoordenadas,
            title: "Mi posicion"
        });

        marker.setMap(map);
        $("#mapa").css("height", 350);

        var panorama = new google.maps.StreetViewPanorama(
            document.getElementById("street"),
            {
                position: misCoordenadas,
                pov: {
                    heading: 90,
                    pitch: 5,
                },
            }
        );

        map.setStreetView(panorama);
        $("#street").css("height", 350);
    }

    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(localizacion, error);
    }
}

//function initMap(latitud, longitud) {
//    const myLatLng = { lat: latitud, lng: longitud };
//    const map = new google.maps.Map(document.getElementById("google-map"), {
//        zoom: 15,
//        center: myLatLng,
//    });

//    new google.maps.Marker({
//        position: myLatLng,
//        map,
//        title: "Mi posicion",
//    });
//}

//window.initMap = initMap;