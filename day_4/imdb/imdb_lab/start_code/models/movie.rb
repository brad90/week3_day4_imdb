require_relative('../db/sql_runner.rb')



class Movie


  attr_reader :id, :title
  attr_accessor :genre, :budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title= options['title']
    @genre = options['genre']
    @budget = options['budget']
  end


  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    result = SqlRunner.run(sql)
    return Movie.map_items(result)
  end
  #
  # Ask John why this didnt return just first instance with .first
  def self.map_items(movie_data)
    results = movie_data.map{|data| Movie.new(data)}
    return results
  end

  def update()
    sql = "UPDATE movies SET (title, genre, budget) = ($1,$2, $3) WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end


  def stars()
    sql ="SELECT stars.* FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE castings.movie_id = $1;"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map{|star| Star.new(star)}
  end

  # def remaining_budget
  #
  #
  #   total_fee = 0
  #
  #   .each{|fee| fee[]}
  #
  #
  # end


end
