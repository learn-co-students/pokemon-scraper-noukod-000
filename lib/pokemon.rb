class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save name, type, db
    db.execute("INSERT INTO pokemon (name, type) VALUES('#{name}', '#{type}');")
  end

  def self.find id, db
    result = db.execute("SELECT * FROM pokemon WHERE id = #{id};")

    pokemon_array =  result[0]

    pokemon = self.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db, hp: pokemon_array[3])
  end

  def alter_hp health, db
    puts "UPDATE pokemon SET hp = #{health} WHERE id = #{@id};"
    db.execute("UPDATE pokemon SET hp = #{health} WHERE id = #{@id};")
  end
end
