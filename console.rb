require_relative 'models/customer'
require_relative 'models/film'

require 'pry-byebug'

#testing delete_all function
Customer.delete_all()
Film.delete_all()

# Testing saving of new Customers
customer1 = Customer.new ({'name' => 'Ewan', 'funds' => 50})
customer2 = Customer.new ({'name' => 'Darren', 'funds' => 100})
customer3 = Customer.new ({'name' => 'Scott', 'funds' => 75})
customer1.save()
customer2.save()
customer3.save()

# Testing customer update
customer1.name = "Euan"
customer1.update()

# Testing customer delete (wouldn't work with id)
customer2.delete()

# Testing saving of new film
film1 = Film.new ({'title' => 'Zumbieland', 'price' => 13})
film2 = Film.new ({'title' => 'Star Trek', 'price' => 13})
film1.save()
# Testing film update
film1.title = "Zombieland"
film1.update()
# Testing film delete
film2.delete()

nil
