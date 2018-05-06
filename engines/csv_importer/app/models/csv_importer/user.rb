module CsvImporter
  class User < ApplicationRecord
    before_save { self.email_address = email_address.downcase }
    validates :name, :email_address, presence: true
    validates :email_address, uniqueness: { case_sensitive: false }
  end
end
