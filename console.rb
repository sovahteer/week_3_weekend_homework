require_relative 'models/customer'
require_relative 'models/film'
require_relative 'models/ticket'

require 'pry-byebug'

#testing delete_all function
Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

# Testing item creation
customer1 = Customer.new ({'name' => 'Ewan', 'funds' => 50})
customer2 = Customer.new ({'name' => 'Darren', 'funds' => 100})
customer3 = Customer.new ({'name' => 'Scott', 'funds' => 75})
customer4 = Customer.new ({'name' => 'Chris', 'funds' => 80})

customer1.save()
customer2.save()
customer3.save()
customer4.save()

# Testing customer update
customer1.name = "Euan"
customer1.update()

film1 = Film.new ({'title' => 'Sulu: A Star Wars Story', 'price' => 13})
film2 = Film.new ({'title' => 'Deadpool 2', 'price' => 13})
film3 = Film.new ({'title' => 'Avengers: Infinity War', 'price' => 13})
film4 = Film.new ({'title' => 'Jurassic World 2: Fallen Kingdom', 'price' => 13})
film5 = Film.new ({'title' => 'Star Trek II: Wrath of Khan', 'price' => 5})

film1.save()
film2.save()
film3.save()
film4.save()
film5.save()

# Testing film update
film1.title = "Solo: A Star Wars Story"
film1.update()

ticket1 = Ticket.new ({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new ({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3 = Ticket.new ({'customer_id' => customer3.id, 'film_id' => film4.id})
ticket4 = Ticket.new ({'customer_id' => customer4.id, 'film_id' => film3.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

# Testing ticket update
ticket3.film_id = film1.id
ticket3.update()

p customer1.films()
p film1.customers()

# # # Testing item deletion (deleting customers wouldn't work with id)
# ticket4.delete()
# film3.delete()
# customer4.delete()
nil
