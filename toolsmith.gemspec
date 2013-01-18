$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "toolsmith/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "toolsmith"
  s.version     = Toolsmith::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "A gem to craft UI's easily."
  s.description = "Toolsmith provides common helpers for UI components and styles."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "compass-rails", "~> 1.0.3"
  s.add_dependency "bootstrap-sass", "~> 2.2.1.1"

  s.add_development_dependency "rspec-rails", "~> 2.11.0"
  s.add_development_dependency "guard-rspec", "~> 2.3.3"
  s.add_development_dependency "rb-fsevent", "~> 0.9.1"
  s.add_development_dependency "nokogiri", "~> 1.5.6"
end