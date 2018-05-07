require 'csv_importer/engine'

task users: :environment do
  desc 'Import users from csv'

  WebImport.new(url: 'http://assets.cahootify.com/recruitment/people.csv').call
end
