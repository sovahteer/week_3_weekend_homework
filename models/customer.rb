require 'pry'
require_relative '../db/sql_runner'
require_relative 'film'
require_relative 'ticket'

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i if options['funds']
  end

  def save()
    sql = "INSERT INTO customers ( name, funds )
           VALUES ( $1, $2 )
           RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ( $1, $2 )
           WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers
           WHERE name = $1"
    values = [@name]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT title FROM films
	         INNER JOIN tickets
	         ON films.id = tickets.film_id
	         WHERE customer_id = $1"
    values = [@id]
    SqlRunner.run(sql, values).values()
  end

  def buy_ticket(film)
    @funds -= film.price
    update()
  end

  def how_many_films
    films.length
  end

  def self.all
    sql = " SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customers| Customer.new ( customer )}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end
