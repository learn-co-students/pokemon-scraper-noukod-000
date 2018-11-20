class Pokemon

  @@all = []

   attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: nil, name:, type: , db:, hp: 60)
      @id = id
      @name = name
      @type = type
      @db = db
      @@all << self
    end

    def self.save(name, type, db)
   db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", [name, type])

 end

 def self.save(name, type, db)
 data = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
 data.execute(name,type)
end

def self.find(id, db)
 data = db.prepare("SELECT * FROM pokemon WHERE id = ?")
 result_set = data.execute(id)

 results = result_set.collect do |row|
   pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
   pokemon.hp = row[3]
   pokemon
 end
 results[0]
end
 # def find(id, db)
 #      db.execute("SELECT * FROM pokemon WHERE id = ?", [id])[0]
 #      #create_or_update_from_data({id: data[0], name: data[1], type: data[2], db: db, hp: data[3]})
 #      id_, name, type, hp = result
 #    # db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",60,id_) if result.length != 3
 #    new(id: id_, name: name, type: type,db: db, hp: hp)
 #    end

 def alter_hp(new_val, db)
     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_val, self.id])
  end
end
