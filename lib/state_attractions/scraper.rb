class StateAttractions::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.thrillist.com/travel/nation/grand-canyon-disney-world-wrigley-field-and-the-best-attractions-to-see-in-the-usa"))
  end

  def scrape_states_index
    self.get_page.css("section.body-text.u-color--dark-gray.u-color--lifestyle-links.font--body.has-mobile-padding.is-standard div.body-text__content")
  end

  def make_states
    scrape_states_index.each do |s|
      StateAttractions::State.new_from_index_page(s)
    end
  end

end
