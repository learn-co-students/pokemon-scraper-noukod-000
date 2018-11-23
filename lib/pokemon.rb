class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: self, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  def self.save

  end

  def self.find

  end
end
