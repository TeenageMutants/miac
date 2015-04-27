$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "more/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "more"
  s.version     = More::VERSION
  s.authors     = ["Michael Hitchens"]
  s.email       = ["michael_hitchens@mail.ru"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of More."
  s.description = "TODO: Description of More."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
