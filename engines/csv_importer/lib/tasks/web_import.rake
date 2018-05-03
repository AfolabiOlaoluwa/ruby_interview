require 'open-uri'
require 'csv'

namespace :web_import do
  desc 'Import users from csv'

  task users: :environment do
    url = 'http://assets.cahootify.com/recruitment/people.csv'
    # I forced encoding so avoid UndefinedConversionError "\xC3" from ASCII-8BIT to UTF-8
    csv_string = open(url).read.force_encoding('UTF-8')

    counter = 0
    duplicate_counter = 0

    user = []
    CSV.parse(csv_string, headers: true, header_converters: :symbol) do |row|
      next unless row[:name].present? && row[:email_address].present?
      user = CsvImporter::User.create row.to_h
      if user.persisted?
        counter += 1
      else
        duplicate_counter += 1
      end
    end
    p "Email duplicate record: #{user.email_address} - #{user.errors.full_messages.join(',')}" if user.errors.any?

    p "Imported #{counter} users, #{duplicate_counter} duplicate rows ain't added in total"
  end
end