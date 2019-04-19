require('pry')
require_relative('../model/film.rb')
require_relative('../model/customer.rb')
require_relative('../model/tickets.rb')

require( 'pry-byebug' )

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
  'name' => 'Andrew Bradley','funds' => 200})
customer1.save()

customer2 = Customer.new({
  'name' => 'Bob Smith','funds' => 100})
customer2.save()

customer3 = Customer.new({
  'name' => 'Helen Thompson','funds' => 400})
customer3.save()

customer3.funds = 5000
customer3.update

film1 = Film.new({'title' => "Mission Impossible",'price' => 10})
film1.save()

film2 = Film.new({'title' => "Avitar 2",'price' => 10})
film2.save()

film3 = Film.new({'title' => "Rocky 18", 'price' => 10})
film3.save()

film3.price = 20
film3.update


tickets1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
tickets1.save()

tickets2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
tickets2.save()

tickets3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
tickets3.save()

tickets4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
tickets4.save()

tickets5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
tickets5.save()

tickets6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
tickets6.save()

tickets7 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
tickets7.save()



binding.pry
nil
