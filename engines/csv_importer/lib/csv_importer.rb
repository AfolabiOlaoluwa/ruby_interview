require 'csv_importer/engine'

class WebImport
  def initialize(url)
    @url = url
  end

  def call
    url = 'http://assets.cahootify.com/recruitment/people.csv'
    csv_string = open(url).read.force_encoding('UTF-8')

    string_to_users(csv_string)
  end

  def string_to_users(csv_string)
    counter = 0
    duplicate_counter = 0

    CSV.parse(csv_string, headers: true, header_converters: :symbol) do |row|
      next unless row[:name].present? && row[:email_address].present?
      user = CsvImporter::User.create row.to_h
      if user.persisted?
        counter += 1
      else
        duplicate_counter += 1
      end
      # user = []
      if user.errors.any?
        p "Email duplicate record: #{user.email_address} - #{user.errors.full_messages.join(',')}"
      end
    end
    p "Imported #{counter} users, #{duplicate_counter} duplicate rows ain't added in total"
  end
end