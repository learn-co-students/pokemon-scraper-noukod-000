class Pokemon
  attr_accessor :id, :name, :db, :type, :hp

  def initialize id:, name:, type:, db:, hp: ""
    @id, @name, @type, @db, @hp = id, name, type, db, hp

  end

  def self.save name, type, db
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find id, db
    result = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    id_, name, type, hp = result
    # db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",60,id_) if result.length != 3
    new(id: id_, name: name, type: type,db: db, hp: hp)
  end

  def alter_hp (hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,id)
  end

end
