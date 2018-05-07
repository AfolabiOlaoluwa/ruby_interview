require 'csv_importer/engine'

# namespace :csv_import do
# end


task users: :environment do
  desc 'Import users from csv'

  WebImport.new(url: 'http://assets.cahootify.com/recruitment/people.csv').call
end
