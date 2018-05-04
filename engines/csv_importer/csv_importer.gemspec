$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'csv_importer/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'csv_importer'
  s.version     = CsvImporter::VERSION
  s.authors     = ['Afolabi Olaoluwa']
  s.email       = ['contact@afolabiolaluwa.com']
  s.homepage    = 'http://www.mysite.afolabiolaoluwa.com'
  s.summary     = 'CsvImporter.'
  s.description = 'A modular CsvImporter Coding test'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.6'

  # Other dependencies needed
  s.add_dependency 'jquery'
  s.add_dependency 'turbolinks'

  s.add_development_dependency 'sqlite3'
end
