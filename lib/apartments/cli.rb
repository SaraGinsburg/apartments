 class Apartments::CLI

   def call
     Apartments::Scraper.new.make_apartments
     puts "Welcome to the latest listing of NY area Apartments. Hit 'Enter' to continue"
     gets
     start
   end

   def start
     print_apartments
     select_apartment
     see_another?
   end

   def select_apartment
     puts ""
     input = nil
     while input.nil? || !input.between?(1,Apartments::Apartment.count)
       puts "which apartment would you like to have more information about?"
       input = gets.strip.to_i
     end
     apartment = Apartments::Apartment.find(input.to_i)
     print_apartment(apartment)
   end


   def see_another?
     puts ""
     puts "Would you like to see another apartment? (Y/N)"
     input = gets.strip.upcase
     if input == "Y"
       start
     elsif input == "N"
       puts ""
       puts "Good luck in your apartment search. Have a nice day!"
       exit
     else
       puts ""
       puts "Not sure what you have in mind.."
       see_another?
     end
   end


   def print_apartment(apartment)
     puts ""
     puts "----- #{apartment.title} -----"
     puts ""
     puts "bedrooms / area:            #{apartment.area}"
     puts "rental price:               #{apartment.price}"
     puts "neighborhood:               #{apartment.neighborhood}"
     puts "date advertised:            #{apartment.date}"
     puts "apartment url:              #{apartment.url}"
     puts ""
     puts "----------------------------- Description -----------------------------"
     puts "#{apartment.description}"
     puts ""
   end

   def print_apartments
     puts ""
     puts "----------------------------- Apartments -----------------------------"
     puts ""
     Apartments::Apartment.all.each.with_index(1) do |apartment, idx|
       spacer = apartment.price.nil? ? [' '].cycle(20).to_a.join("") : [' '].cycle(20 - apartment.price.length).to_a.join("")
       puts "#{idx}.\t #{apartment.price} #{spacer}\t #{apartment.neighborhood}"
     end
   end
end
