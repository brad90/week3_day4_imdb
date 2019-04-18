require_relative('../db/sql_runner.rb')
require_relative('movie.rb')
require_relative('star.rb')
require('pry')


class Casting

    attr_reader :id, :star_id, :movie_id
    attr_accessor :fee

    def initialize( options )
      @id = options['id'].to_i if options['id']
      @star_id= options['star_id'].to_i
      @movie_id = options['movie_id'].to_i
      @fee = options['fee'].to_i
    end


    def save()
      sql = "INSERT INTO castings (star_id, movie_id, fee) VALUES ($1, $2, $3) RETURNING id"
      values = [@star_id, @movie_id, @fee]
      result = SqlRunner.run(sql, values).first
      @id = result['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM castings"
      result = SqlRunner.run(sql)
      return Casting.map_items(result)
    end
    #
    # Ask John why this didnt return just first instance with .first
    def self.map_items(casting_data)
      results = casting_data.map{|data| Casting.new(data)}
      return results
    end


    def update()
      sql = "UPDATE castings SET fee = $1 WHERE id = $2"
      values = [@fee, @id]
      SqlRunner.run(sql,values)
    end

    def self.delete_all
      sql = "DELETE FROM castings"
      SqlRunner.run(sql)
    end

end
