function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(53, 13),
      zoom: 13
    };
    
    map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
    
    things.forEach(function(thing){
      position = new google.maps.LatLng(thing.lat,thing.lng)
      add_marker(position, thing.name, thing.imgpath, thing.url, null)
     })

    set_center()
}


function start_map() {
  google.maps.event.addDomListener(window, 'load', initialize);
}


function add_marker(center, title, imgpath, url, category) {
    var content = '<a href="'+url+'" id="content">'+
      '<h4 id="firstHeading" class="firstHeading">'+title+'</h4>'+
      '<div id="bodyContent">'+
      '<p><img style="width: 250px;" src="'+imgpath+'"></p>'+
      '</div>'+
      '</div>';
    
    var image = '/img/cat_food.png';

    var infowindow = new google.maps.InfoWindow({
      content: content,
      maxWidth: 500
    });

    var marker = new google.maps.Marker({
      position: center,
      map: map,
      title: title,
      icon: image
      });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map,marker);
    });

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

