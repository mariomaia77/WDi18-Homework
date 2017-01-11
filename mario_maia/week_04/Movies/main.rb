require 'pry' # use binding.pry for debugging
require 'sinatra'
require 'sinatra/reloader' #allows url to update wihtout needign to go to terminal and stop/restart ruby main.rb
require 'httparty' # httparty allows you to request information


      # get "/" do
      #   erb :home  # goes into the views folder, get the home.erb folder
      #              # evaluate if there is any dynamic ruby stuff
      #              #place it where the yield statement is in the views/layout.erb
      # end

      get "/movies" do
        # touch views/movies.erb
        erb :movies
      end

      # to get information using a form
        # Display the form on one pages
          # Form needs to have a method and an action
          #All inputs need to have a name attribute
        #Dispolay the results on a second page


      get "/results" do
        movie_name =params["movie"]
        url = "http://www.omdbapi.com/?t=#{movie_name}"
        @movie = HTTParty.get( url )

        erb :results
      end
