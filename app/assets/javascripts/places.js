function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(53, 13),
      zoom: 7
    };
     map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);

     things.forEach(function(place){
      add_marker(place.place, place.name)


     })

    set_center()
     // position = 

     // marker = add_marker(new google.maps.LatLng(52,13), "berlin")
}




function add_marker(center, title) {

  new google.maps.Marker({
    map: map, 
    position: center,
    title: title

  })

  // map.setCenter(center);

}

function set_center() {
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
     }, 
     // function() {
    //   handleNoGeolocation(browserSupportFlag);
    // }
    null);
  }
}

// $(document).on("page:change", function(){
//  initialize();

// })

function start_map(){
  google.maps.event.addDomListener(window, 'load', initialize);
}