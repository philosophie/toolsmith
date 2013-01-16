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
  s.summary     = "TODO: Summary of Toolsmith."
  s.description = "TODO: Description of Toolsmith."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "rspec-rails", "~> 2.11.0"
end
