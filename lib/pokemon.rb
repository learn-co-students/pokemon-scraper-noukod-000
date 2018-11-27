class Pokemon
attr_accessor :id,:name,:type,:db,:hp
@@all = []

def initialize(id:nil,name:nil,type:nil,hp:nil,db:nil)
    @id=id
    @name=name
    @type=type
    @hp=hp
    @db=db
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon(name,type) VALUES(?,?)",name,type)
  end

  def self.find (id,db)
  pokemon=db.execute("SELECT * FROM pokemon WHERE id=?",id)
  pokemon_object={id:pokemon[0][0],name:pokemon[0][1],type:pokemon[0][2]}
  pokemon_instance=Pokemon.new(pokemon_object)
  end

end
