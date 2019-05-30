class Pokemon
  attr_accessor :id,:name,:type, :db, :hp

  def initialize (id:, name:, type:, db:, hp: "")
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name,type,database_connection)
    database_connection.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name, type)
  end

  def self.find(id,database_connection)
    answer = database_connection.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    id_, name, type, hp = answer

    new(id: id_, name: name, type: type,db: database_connection, hp: hp)
  end

  def alter_hp(num, db)
        db.execute("UPDATE pokemon SET hp = #{num}
                WHERE id = #{self.id}")
    end

end
