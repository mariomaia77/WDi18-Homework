// img is referencing the image within the div-tag
animID = window.setInterval(function() {
   img.parent().css("left", parseInt(imgLeft) + "px");
   img.parent().css("top",  parseInt(imgTop) + "px");
   imgLeft += chgX;
   imgTop  += chgY;
}, updateInterval);
