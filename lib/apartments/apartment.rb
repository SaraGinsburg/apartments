class Apartments::Apartment

  attr_accessor :area, :price, :neighborhood, :date, :img, :description, :apt

  @@all = []


  def self.new_from_index_page(apt)
   # binding.pry
   area = apt.css('span.housing').text[/\d+/]  || ''
   price = apt.css('span.result-price')[0].text || ''
   neighborhood = apt.css('p.result-info').css('span.result-hood').text || ''
   url = apt.css('a').attribute('href').value || ''
   self.new(area, price, neighborhood, url)

  end


  def initialize(area=nil, price=nil, neighborhood=nil, url=nil)
    @area = area
    @price = price
    @neighborhood = neighborhood
    @url = url
    @@all << self
  end

  def self.all
     # binding.pry
     @@all
  end
  #
  # def self.find(id)
  #   @@all[id - 1]
  # end
  #
  # def title
  #   @title ||= doc.css('p.result-info').css('a').text.split("\n")[0]
  # end
  #
  # def date
  #   @date ||= doc.css('p').css('time').text
  # end
  #
  # def doc
  #   @doc ||= Nokogiri::HTML(open(self.url))
  # end
end
