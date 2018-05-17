class Apartments::Scraper

   def get_page
     Nokogiri::HTML(open("https://newyork.craigslist.org/d/housing/search/hhh"))
   end

   def scrape_apartments
     self.get_page.css('li.result-row')
   end

   def make_apartments
     scrape_apartments.each do |apt|
       Apartments::Apartment.new_from_index_page(apt)
    end
   end

   def self.scrape_detail(url)
     Nokogiri::HTML(open(url))
   end
end
