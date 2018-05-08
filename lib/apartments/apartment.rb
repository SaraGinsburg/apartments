class Apartments::Apartment

  attr_accessor :area, :price, :neighborhood, :date, :img, :description, :apt

  @@all = []


  def self.new_from_index_page(apt)
   area = apt.css('span.housing').text[/\d+/] unless apt.css('span.housing').nil?
   price = apt.css('span.result-price')[0].text unless apt.css('span.result-price')[0].nil?
   neighborhood = apt.css('p.result-info').css('span.result-hood').text unless apt.css('p.result-info').css('span.result-hood').nil?
   url = apt.css('a').attribute('href').value unless apt.css('a').attribute('href').nil?
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
     binding.pry
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
