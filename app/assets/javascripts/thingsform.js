$(document).ready(function() {
  set_current_location()
  set_thing_radio_buttons()

  $(".new_thing" ).submit(function(e){
    e.preventDefault();
    form = this
    $(form).unbind('submit');

    if (location_field.value) {
      use_geocoder();
    } else {
      use_current_location()
    }
            
  })

});

function use_geocoder() {
  geocoder = new google.maps.Geocoder();
  geocoder.geocode({ address: location_field.value },  function(results, status){
    latlng = results[0].geometry.location
    set_thing_form_lat_lng()
  })
}

function use_current_location(){
  latlng = currentLocation;
  set_thing_form_lat_lng()
}


function set_thing_radio_buttons() {
  location_field = $(".new_thing #thing_location")[0]
  $(location_field).hide()


  $(".new_thing #location_here").click(function() {
    $(location_field).hide()
    location_field.value = ""
  })

  $(".new_thing #location_elsewhere").click(function() {
    $(location_field).show()
  })


}

function set_thing_form_lat_lng() {
  $("#thing_lat")[0].value = latlng.lat();
  $("#thing_lng")[0].value = latlng.lng();    
  console.log($("#thing_lat")[0].value);
  $(form).trigger('submit');
}

function set_current_location() {

  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      currentLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    }, null);
  }
}