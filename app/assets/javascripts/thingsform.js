$(document).ready(function() {

  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      currentLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    }, null);
  }

  $( ".new_thing" ).submit(function(event){
    $("#thing_lat")[0].value = currentLocation.lat();
    $("#thing_lng")[0].value = currentLocation.lng();    
    console.log($("#thing_lat")[0].value);
  })
});