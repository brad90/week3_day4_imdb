require('pry')
require_relative('../model/film.rb')
require_relative('../model/customer.rb')
require_relative('../model/tickets.rb')
require_relative('../model/showtime.rb')

require( 'pry-byebug' )

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()
Showtime.delete_all()

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

showtime1 = Showtime.new({'film_id' => film1.id, 'showtime' =>'20:00', 'max_capacity' => 50 })

showtime1.save()

showtime2 = Showtime.new({'film_id' => film3.id, 'showtime' =>'17:00', 'max_capacity' => 40  })
showtime2.save()

showtime3 = Showtime.new({'film_id' => film1.id, 'showtime' =>'16:00', 'max_capacity' => 50 })
showtime3.save()

showtime4 = Showtime.new({'film_id' => film2.id, 'showtime' =>'11:00', 'max_capacity' => 50 })
showtime4.save()

showtime2.showtime = '23:00'
showtime2.update


tickets1 = Ticket.new({'customer_id' => customer1.id, 'showtime_id' => showtime1.id})
tickets1.save()

tickets2 = Ticket.new({'customer_id' => customer1.id, 'showtime_id' => showtime3.id})
tickets2.save()

tickets3 = Ticket.new({'customer_id' => customer2.id, 'showtime_id' => showtime2.id})
tickets3.save()

tickets4 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime1.id})
tickets4.save()

tickets5 = Ticket.new({'customer_id' => customer2.id, 'showtime_id' => showtime1.id})
tickets5.save()

tickets6 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime2.id})
tickets6.save()

tickets7 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime1.id})
tickets7.save()

tickets15= Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime2.id})
tickets15.save()

tickets8 = Ticket.new({'customer_id' => customer2.id, 'showtime_id' => showtime3.id})
tickets8.save()

tickets9 = Ticket.new({'customer_id' => customer1.id, 'showtime_id' => showtime1.id})
tickets9.save()

tickets10 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime2.id})
tickets10.save()

tickets11 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime2.id})
tickets11.save()

tickets12 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime1.id})
tickets12.save()

tickets13 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime2.id})
tickets13.save()

tickets14 = Ticket.new({'customer_id' => customer3.id, 'showtime_id' => showtime3.id})
tickets13.save()







binding.pry
nil
