require 'csv_importer/engine'

namespace :import do
  desc 'Import users from csv'

  task users: :environment do
    # filename = File.join Rails.root, '/engines/csv_importer/people.csv'
    filename = File.join Rails.root, 'engines', 'csv_importer', 'people.csv'
    counter = 0
    unimported_counter = 0

    user = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      next unless row[:name].present? && row[:email_address].present?
      user = CsvImporter::User.create row.to_h
      if user.persisted?
        counter += 1
      else
        unimported_counter += 1
      end
    end
    p "Email duplicate record: #{user.email_address} - #{user.errors.full_messages.join(',')}" if user.errors.any?

    p "Imported #{counter} users, #{unimported_counter} duplicate rows ain't added in total"
  end
end