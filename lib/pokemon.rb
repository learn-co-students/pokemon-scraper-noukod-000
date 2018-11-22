class Pokemon
attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:, hp: "")

  end

  def self.save name, type, db
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id, db)
 data = db.prepare("SELECT * FROM pokemon WHERE id = ?")
 result_set = data.execute(id)

 results = result_set.collect do |row|
   pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
   pokemon.hp = row[3]
   pokemon
 end
 result

  def alter_hp hp, db
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,id)
  end
end
