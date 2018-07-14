require 'pry'
require_relative '../db/sql_runner'

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i if options['price']
  end

  def save()
    sql = "INSERT INTO films ( title, price )
           VALUES ( $1, $2 )
           RETURNING id"
    values = [@title, @price]
    customer = SqlRunner.run( sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ( $1, $2 )
           WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films
           WHERE title = $1"
    values = [@title]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = " SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |films| Film.new ( film )}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end
end
