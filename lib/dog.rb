class Dog
  attr_accessor :owner, :mood
  attr_reader :name 
  
  @@all = []
  
  def initialize(name, owner)
    @owner = owner
    @name = name
    @name = self.name
    @mood = "nervous"
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end