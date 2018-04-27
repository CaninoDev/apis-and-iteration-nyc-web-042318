require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
   #make the web request
  film_roster = []
  nextpage = 'http://www.swapi.co/api/people/'
  all_characters = RestClient.get(nextpage)
  character_hash = JSON.parse(all_characters)
  nextpage = character_hash['next']
  while film_roster.length == 0 && !nextpage.nil?
    all_characters = RestClient.get(nextpage)
    character_hash = JSON.parse(all_characters)
    nextpage = character_hash['next']
    character_infobus = character_hash['results']
    character_infobus.each do |character_info|
      film_roster = character_info['films']
      break
    end
  end

  film_roster
    # iterate over the character hash to find the collection of `films` for the given
    #   `character`
    # collect those film API urls, make a web request to each URL to get the info
    #  for that film
    # return value of this method should be collection of info about each film.
    #  i.e. an array of hashes in which each hash reps a given film
    # this collection will be the argument given to `parse_character_movies`
    #  and that method will do some nice presentation stuff: puts out a list
    #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  films_url_array = []
  films_hash.each do |film_urls|
    films_url_array << film_urls
  end

  episode_infobus_array = []

  films_url_array.each do |film_url|
    episode = RestClient.get(film_url)
    episode_infobus_array << JSON.parse(episode)
  end

  episode_infobus_array.each do |episode_info|
    puts episode_info["title"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
