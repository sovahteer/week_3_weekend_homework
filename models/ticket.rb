require 'pry'
require_relative '../db/sql_runner'

class Film

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i if options ['customer_id']
    @film_id = options['film_id'].to_i if options['film_id']
  end

  def save()
  end
end
