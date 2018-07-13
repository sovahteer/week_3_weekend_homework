require_relative 'models/customer'

require 'pry-byebug'

customer1 = Customer.new ({ 'name' => 'Euan', 'funds' => 50 })
customer1.save()
#
# nil
