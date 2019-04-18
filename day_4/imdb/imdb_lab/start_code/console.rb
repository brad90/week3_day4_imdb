require('pry')
require_relative('models/star.rb')
require_relative('models/movie.rb')
require_relative('models/casting.rb')


require( 'pry-byebug' )

Movie.delete_all()
Star.delete_all()
Casting.delete_all()

star1 = Star.new({ 'first_name' => 'Samwise', 'last_name' => 'Gamgee' })
star1.save()
star2 = Star.new({ 'first_name' => 'Frodo', 'last_name' => 'Baggins' })
star2.save()
star3 = Star.new({ 'first_name' => 'Gollum', 'last_name' => 'Bob' })
star3.save()

movie1 = Movie.new({ 'title' => 'Lord of a rings', 'genre' => 'fantasy'})
movie1.save()
movie2 = Movie.new({ 'title' => 'Trainspotting', 'genre' => 'documentary'})
movie2.save()
#
#
#
casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 1000})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star3.id, 'fee' => 500})
casting2.save()



binding.pry
nil
