movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

good_movies =  movie_ratings.select { |movies, rating| rating > 3 }
4star_movies =  movie_ratings.select { |movies, rating| rating == :skyfall  }
