class StateAttractions::State

  attr_accessor :name, :attraction, :url

  @@all = []

  def self.new_from_index_page(s)
    self.new(
    s.css("h2.body-text__paragraph-header.font--h2").text.strip,
    s.css("p.body-text__paragraph-text.font--body.has-spacing").text.strip,
    s.css("a").attribute("href").value
    )
  end

  def initialize(name=nil, attraction=nil, url=nil)
    @name = name
    @attraction = attraction
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
