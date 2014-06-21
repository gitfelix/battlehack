function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(53, 13),
      zoom: 7
    };
     map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);

     things.forEach(function(thing){
      console.log(thing.lat)
      console.log(thing.lng)
      position = new google.maps.LatLng(thing.lat,thing.lng)
      add_marker(position, thing.name)


     })

    set_center()
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