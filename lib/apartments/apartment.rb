class Apartments::Apartment

  attr_accessor :area, :price, :neighborhood, :date, :img, :description, :apt, :url

  @@all = []


  def self.new_from_index_page(apt)
   url = apt.css('a').attribute('href').value unless apt.css('a').attribute('href').nil?
   area = apt.css('span.housing').text.gsub("\n","").gsub("-","").squeeze.strip unless apt.css('span.housing').nil?
   price = apt.css('span.result-price')[0].text unless apt.css('span.result-price')[0].nil?
   neighborhood = apt.css('p.result-info').css('span.result-hood').text.gsub(/[()]/, "").strip unless apt.css('p.result-info').css('span.result-hood').nil?
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
     @@all
  end

  def self.count
    @@all.length
  end
  
  def self.find(id)
    @@all[id - 1]
  end

  def title
    @title ||= doc.css('h2.postingtitle span#titletextonly').text.gsub(/[^[:print:]]/i, '')
  end

  def description
    # binding.pry
    @description ||=  doc.css('#postingbody').text.gsub(/\P{ASCII}/,'').gsub("\n", " ").gsub("    QR Code Link to This Post ","")
  end

  def date
    @date ||= doc.css('p').css('time').text.split("\n")[1].strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def apt_url
    @apt_url ||= self.url
  end
end
