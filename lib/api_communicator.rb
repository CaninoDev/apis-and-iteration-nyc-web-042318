require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  nextpage = false

  film_roster = []
  # Ignore the top level fluff from the hash.
  characters_infobus = character_hash["results"]
  characters_infobus.each do |character_info|
    if character_info["name"].downcase == character
      film_roster = character_info["films"]
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

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
