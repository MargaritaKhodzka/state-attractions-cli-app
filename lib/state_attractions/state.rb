class StateAttractions::State

  attr_accessor :name, :attraction, :url

  @@all = []

  def initialize(name=nil, attraction=nil, url=nil)
    @name = name
    @attraction = attraction
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all[id]
  end

end
