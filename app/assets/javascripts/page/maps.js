$(function() {

  function initMap() {
    const PL = {lat: 51.194874549999994, lng: 16.18512277614075};
    const map = new google.maps.Map(
        document.getElementById('map'), {zoom: 7, center: PL});

    let jobs = document.querySelectorAll('.home_jobs--list a')
    $(jobs).each(function (inx) {
      const lat = $(this).data('latitude');
      const lng = $(this).data('longitude');
      const `marker${inx}`] = new google.maps.Marker({lat: lat , lng: lng , map: map});
    });
  }

  if ($('#map').length > 0) {
    initMap();
  }

});