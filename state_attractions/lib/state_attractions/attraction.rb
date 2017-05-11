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
    binding.pry
    state = self.new
    state.name = doc.search("h2.body-text__paragraph-header font--h2").text
    state.attraction = doc.search("a.US Space and Rocket Center").attr("href")
    state.description = doc.search("p.body-text__paragraph-text font--body has-spacing").text

    state
  end

end
