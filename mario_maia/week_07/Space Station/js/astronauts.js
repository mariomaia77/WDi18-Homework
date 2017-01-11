var astronautsURL = "http://api.open-notify.org/astros.json";

var displayAstronautNumber = function ( json ) {
  var result = json.number;

  var $p = $("<p></p>");
  $p.text( result );

  $(".astronauts .content").prepend( $p );
};

var getAstronautNumber =  function () {

  $.ajax({
    url: astronautsURL,
    type: "GET",
    dataType: "JSONP"
  }).done( displayAstronautNumber );
};

$(document).ready(function () {
  getAstronautNumber();

});

// // img is referencing the image within the div-tag
// animID = window.setInterval(function() {
//    img.parent().css("left", parseInt(imgLeft) + "px");
//    img.parent().css("top",  parseInt(imgTop) + "px");
//    imgLeft += chgX;
//    imgTop  += chgY;
// }, updateInterval);
