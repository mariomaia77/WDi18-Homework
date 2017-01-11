// READY STATES
// We can access these using the xhr request's XHRObject.readyState property.

// 0 - var xhr = new XMLHttpRequest()
// 1 - xhr.open()
// 2 - xhr.send()
// 3 - request is being processed
// 4 - request processed, and response is ready.

// EVENT HANDLER
window.onload = function () {
  var btn = document.querySelector("button");
  btn.addEventListener( "click", function () {
    // GET the input's current value
    var input = document.querySelector("input").value;
    // Assemble the URL I want to send the request to:
    var url = "http://www.omdbapi.com/?s=" + input;
    // MAKE A NEW REQUEST - create a new instance of the XMLHttpRequest object.
    var request = new XMLHttpRequest();
    // OPEN REQUEST - call the open method on the xhr request, passing in two arguments - the HTTP Method (eg 'GET', 'POST') and the URL you want to send the request to:
    request.open("GET", url);
    request.send();

    // LISTEN FOR CHANGES TO THE REQUEST'S READY STATE - the only one we care about at this point is readyState 4 - that is, when the request has been processed, the response has been received and is ready to be used.
    request.onreadystatechange = function() {
      if (request.readyState !== 4) {
        return false;
      }
    // The response will be stored in the responseText property of the xhr object. But all we get back is a string that _looks_ like a JavaScript Object (this is called 'JSON' - JavaScript Object Notation - a string that is formatted like a JavaScript Object).
    // To turn this into something we can access and manipulate using JavaScript, we need to parse this JSON string as a JavaScript object, by passing the JSON into the JSON Object's .parse method.
    var parseData = JSON.parse( request.responseText );
        console.log( parseData );
        searchMovieDatabase( parseData );
    // We'll store it in a variable so we can access/manipulate the response using good old fashioned JS methods, like:

    // Object.keys(res);  // Get all the keys in the response.
    // res["Title"]       // Look up the "Title" key in the response.

    // Ordinarily, we'll want to use JavaScript to take values from the response and manipulate the DOM using those values (eg, creating an element, changing the text of that element to be a value in the xhr.responseText and appending it to the DOM).
  };
});

  var searchMovieDatabase = function( parseData ) {
    var result = document.querySelector(".result");
    result.innerHTML = ""; // will all the result to be returned back on the html page
    for ( var i = 0; i < parseData.Search.length; i += 1 ) {
      var searchResult = document.createElement("div"); // creating a div in html
      var title = parseData.Search[i]["Title"];
      var newTitle = document.createTextNode(title);
      searchResult.appendChild(newTitle);
      result.appendChild( searchResult );
      result.appendChild(document.createElement("br")); // creating a break line in the html
      secondListener( searchResult, title );
    }
  };

  var secondListener = function ( searchResult, title ) {
    searchResult.addEventListener("click", function () {
      var searchUrl = "http://www.omdbapi.com/?t=" + title; // once you click on the title it will start the process again, making a request to the server with the new url
      var movieRequest = new XMLHttpRequest(); //will request url with the title of the movie
      movieRequest.open("GET", searchUrl);
      movieRequest.send();
      movieRequest.onreadystatechange = function(){
        if (movieRequest.readyState !== 4) {
          return false;
        }
        var parseMovie = JSON.parse( movieRequest.responseText );
        console.log( parseMovie );
        displayMovie( parseMovie );
      };
    });
  };

  var displayMovie = function (parseMovie) {
      console.log(parseMovie);
      var movieTitle = parseMovie["Title"];
      var showTitle = document.createElement("h4");
      showTitle.innerHTML = movieTitle;

      var movieYear = parseMovie["Year"];
      var showYear = document.createElement("p");
      showYear.innerHTML = "Release: " + movieYear;

      var movieDirector = parseMovie["Director"];
      var showDirector = document.createElement("h3");
      showDirector.innerHTML = "Director: " + movieDirector;

      var movieActors = parseMovie["Actors"];
      var showActors = document.createElement("p");
      showActors.innerHTML = "Actors: " + movieActors;

      var movieRuntime = parseMovie["Runtime"];
      var showRuntime = document.createElement("p");
      showRuntime.innerHTML = "Runtime: " + movieRuntime;

      var moviePoster = parseMovie["Poster"];
      var showPoster = document.createElement("img");
      showPoster.setAttribute("src",moviePoster);

      var resultMovie = document.querySelector(".result");
      resultMovie.innerHTML = "";
      resultMovie.appendChild(showTitle);
      resultMovie.appendChild(showYear);
      resultMovie.appendChild(showDirector);
      resultMovie.appendChild(showActors);
      resultMovie.appendChild(showRuntime);
      resultMovie.appendChild(showPoster);
  };

};
