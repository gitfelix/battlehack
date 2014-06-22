function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(52, 13),
      zoom: 12
    };
    
    map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
    
    things.forEach(function(thing){
      position = new google.maps.LatLng(thing.lat,thing.lng)
      iconimage = getRandomImage(1,5)
      add_marker(position, thing.name, thing.imgpath, thing.url, iconimage)
     })

    if (things.length == 1) {
        set_center_on_thing(things[0])
    }
      else {
        set_center()
      }
    console.log("yo")
}

function getRandomNumber(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min  
}


function getRandomImage(min, max) {
  number = Math.floor(Math.random() * (max - min + 1)) + min;
  return '/img/icon' + number + '.png'
}


function start_map() {
  google.maps.event.addDomListener(window, 'load', initialize);
}


function add_marker(center, title, imgpath, url, iconimage) {
    var content = '<a href="'+url+'" id="content">'+
      '<h4 id="firstHeading" class="firstHeading">'+title+'</h4>'+
      '<div id="bodyContent">'+
      '<p><img style="width: 250px;" src="'+imgpath+'"></p>'+
      '</div>'+
      '</div>';
    
    var image = iconimage;

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

function set_center_on_thing(thing){

  initialLocation = new google.maps.LatLng(thing.lat,thing.lng);
  map.setCenter(initialLocation);
  console.log("on_thing")

}

// $(document).on("page:change", function(){
//  initialize();

// })

