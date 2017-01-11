// create variables of important things //
// based URL
// api keys
// timer IDs



var giphyBaseURL = "http://api.giphy.com/v1/gifs/random";

var API_KEY = "dc6zaTOxFJmzC";
var tag

var displayGiphyGIF = function ( data ) {
  var imgSrc = data.data.image_url; //needs to get this from API os object on console view by typing getGiphyInfo
  var $newImg = $("<img>"); //created new image
  $newImg.attr("src", imgSrc );
  $(".giphy .content").prepend( $newImg );
};

var getGiphyInfo = function ( term ) {
  var params = {
    api_key: API_KEY,
    tag: term  // whatever you type on the page will eb the search
  };

      $.ajax({
        url: giphyBaseURL,
        type: "GET",
        dataType: "JSON",
        data: params
      }).done( displayGiphyGIF );
};

$(document).ready(function () {

  $(".giphy button").on("click", function () {
    var searchTerm = $(".giphy input").val();

    if ( searchTerm.length === 0 ) {
      $(".giphy input").css({
        "border": "1px solid red"
      });
      return false;
    }
    // If there is no search term
      // change the border of the input to reduce
      // donct call getGiphyInfo
    getGiphyInfo( searchTerm );
});

});
