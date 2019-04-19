require_relative('../db/sqlrunner.rb')



class Film

  attr_reader :id, :title
  attr_accessor :price



  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end


  def save()
    sql = "INSERT INTO films(title, price)
    VALUES ($1,$2) RETURNING id;"
    values = [@title,@price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete(id)
    sql = "DELETE FROM films WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    result = SqlRunner.run(sql)
    return Film.map_items(result)
  end

  def self.map_items(film_data)
    result = film_data.map{|data| Film.new(data)}
    return result
  end


end
