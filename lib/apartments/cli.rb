 class Apartments::CLI

   def call
     Apartments::Scraper.new.make_apartments
     puts "Welcome to our NY Apartments Listing"
     start
   end

   def start

     print_apartments

     puts ""
     puts "What number apartment would you like to look into?"
     input = gets.strip

     apartment = Apartments::Apartment.find(input.to_i)
     print_apartment(apartment)

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
       start
     end
   end

   def print_apartment(apartment)
     puts ""
     puts "----------------------------- #{title} -----------------------------"
     puts ""
     puts "area in sqft:                     #{apartment.area}"
     puts "rental price:                     #{apartment.price}"
     puts "neighborhood:                     #{apartment.neighborhood}"
     puts "date advertised:                  #{apartment.date}"
     puts "picture(s) of apartment (url)     #{apartment.img}"
     puts ""
     puts "----------------------------- Description -----------------------------"
     puts "#{apartment.description}"
     puts ""
   end

   def print_apartments
     puts ""
     puts "----------------------------- Apartments -----------------------------"
     puts ""
     Apartments::Apartment.all.each_with_index(1) do |apartment, idx|
       puts "#{idx}.    #{apartment.result-hood}                    #{apartment.price}"
     end
   end
end
