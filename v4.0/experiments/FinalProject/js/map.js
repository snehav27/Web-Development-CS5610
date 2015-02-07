function showDiv(div_number, name) {
    //  alert("came here");
    // hide div that is not selected 
    document.getElementById('map-canvas1').style.display = 'none';
    document.getElementById('map-canvas2').style.display = 'none';

    document.getElementById('h2park').style.display = 'none';
    document.getElementById('h2service').style.display = 'none';

    //  alert("came here2  : " + 'map-canvas' + div_number);

    // just show the div we want
    document.getElementById('map-canvas' + div_number).style.display = 'block';
    document.getElementById('h2' + name).style.display = 'block';

    navigator.geolocation.getCurrentPosition(initialize);


}

$(function () {
    var pull = $('#pull');
    menu = $('nav ul');
    menuHeight = menu.height();

    $(pull).on('click', function (e) {
        e.preventDefault();
        menu.slideToggle();
    });

    $(window).resize(function () {
        var w = $(window).width();
        if (w > 320 && menu.is(':hidden')) {
            menu.removeAttr('style');
        }
    });
});


var map;
var map2;
var service;
var service2;

function handleSearchResults(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {

        var carserviceIcon = "../../images/webImages/carservice.png";
        for (var i = 0; i < results.length; i++) {

            var marker = new google.maps.Marker({
                position: results[i].geometry.location,
                Map: map,

                animation: google.maps.Animation.DROP,
                icon: carserviceIcon,
            });

        }
    }
}
function handleSearchResults2(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {

        var carserviceIcon = "../../images/webImages/car_repair.png";
        for (var i = 0; i < results.length; i++) {

            var marker = new google.maps.Marker({
                position: results[i].geometry.location,
                Map: map2,

                animation: google.maps.Animation.DROP,
                icon: carserviceIcon,
            });

        }
    }
}

function performSearch() {

    var request = {
        bounds: map.getBounds(),
        name: "parking",
    };
    service.nearbySearch(request, handleSearchResults);

}
function performSearch2() {

    var request = {
        bounds: map2.getBounds(),
        name: "car service",
    };
    service2.nearbySearch(request, handleSearchResults2);

}

function initialize(location) {

    var currentLocation = new google.maps.LatLng(location.coords.latitude, location.coords.longitude);

    var mapOptions = {
        center: currentLocation,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(document.getElementById("map-canvas1"),
        mapOptions);
    map2 = new google.maps.Map(document.getElementById("map-canvas2"),
        mapOptions);

    var infowindow = new google.maps.InfoWindow();
    var customizedIcon = "../../images/webImages/currentlocation.png";

    var yourPlaceMarker = new google.maps.Marker({
        position: currentLocation,
        map: map,
        title: "You Are Here!",
        animation: google.maps.Animation.DROP,
        icon: customizedIcon
    });
    var yourPlaceMarker2 = new google.maps.Marker({
        position: currentLocation,
        map: map2,
        title: "You Are Here!",
        animation: google.maps.Animation.DROP,
        icon: customizedIcon
    });
    google.maps.event.addListener(yourPlaceMarker, 'click', function () {
        infowindow.setContent(this.title);
        infowindow.open(map, this);
        infowindow.open(map2, this);

        if (yourPlaceMarker.getAnimation() != null) { yourPlaceMarker.setAnimation(null); }
        else { yourPlaceMarker.setAnimation(google.maps.Animation.BOUNCE); }
        if (yourPlaceMarker2.getAnimation() != null) { yourPlaceMarker2.setAnimation(null); }
        else { yourPlaceMarker2.setAnimation(google.maps.Animation.BOUNCE); }

    });

    service = new google.maps.places.PlacesService(map);
    google.maps.event.addListenerOnce(map, "bounds_changed", performSearch);



    service2 = new google.maps.places.PlacesService(map2);
    google.maps.event.addListenerOnce(map2, "bounds_changed", performSearch2);
}

$(document).ready(function () {
    showDiv(1, park);

});