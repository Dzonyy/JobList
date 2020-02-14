$(function () {
  const mymap = L.map('map').setView([51.9194, 19.1451], 6);
  const markers = document.querySelectorAll('.home_jobs--list li a')

  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    accessToken: 'pk.eyJ1IjoiZHpvbnl5IiwiYSI6ImNrNmpqbjl2eTAxN2wzcnAydjg1YWFrZTcifQ.U7RiWpiS-R9GB02A4zkbDw'
  }).addTo(mymap);

  markers.forEach(marker => {
    marker = new L.marker([marker.getAttribute('data-latitude'), marker.getAttribute('data-longitude')]).addTo(mymap);
  })
});