require_relative('../db/sqlrunner.rb')



class Customer

  attr_reader :id, :name
  attr_accessor :funds



  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end


  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1,$2) RETURNING id;"
    values =  [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values =  [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql)
    return Customer.map_items(result)
  end

  def self.map_items(film_data)
    result = film_data.map{|data| Film.new(data)}
    return result
  end


end
