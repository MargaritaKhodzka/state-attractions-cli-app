class StateAttractions::Attraction

  attr_accessor :name, :attraction, :description

  def self.all
    self.scrape_states
  end

  def self.scrape_states
    states = []
    states << self.scrape_thrillist
    states
  end

  def self.scrape_thrillist
    doc = Nokogiri::HTML(open("https://www.thrillist.com/travel/nation/grand-canyon-disney-world-wrigley-field-and-the-best-attractions-to-see-in-the-usa"))

    state = self.new
    state.name = doc.css("h2").text.strip
    state.attraction = doc.css("a.US Space and Rocket Center").attr("href").text.strip
    state.description = doc.css("p.body-text__paragraph-text font--body has-spacing").text.strip

    state
  end

end
