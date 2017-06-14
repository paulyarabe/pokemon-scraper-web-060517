require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(name)
    @name = name
  end

  def self.save(name, type, db)
    values = name, type
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", values)
  end

  def self.find(id, db)
    found_arr = db.execute("SELECT * FROM pokemon WHERE id = ?;", [id]).flatten
    pokemon = Pokemon.new(found_arr[1])
    pokemon.id = found_arr[0]
    pokemon.name = found_arr[1]
    pokemon.type = found_arr[2]
    pokemon
  end

end
