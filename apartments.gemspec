
require_relative "./lib/apartments/version"

Gem::Specification.new do |spec|
  spec.name          = "apartments"
  spec.version       =  '0.1.0'
  spec.authors       = ["Sara Ginsburg"]
  spec.email         = ["Sara.ginsburg.ny@gmail.com"]
  spec.description   = "Provides details on a user selected apartment in NYC"
  spec.summary       = "Find apartments in NY"
  spec.homepage      = "https://github.com/SaraGinsburg/apartments"
  spec.files         = ["lib/apartments.rb", "lib/apartments/cli.rb", "lib/apartments/scraper.rb", "lib/apartments/apartment.rb", "config/environment.rb"]
  spec.license       = 'MIT'
  spec.executables   << 'apartments'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
