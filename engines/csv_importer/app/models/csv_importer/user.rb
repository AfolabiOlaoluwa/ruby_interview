module CsvImporter
  class User < ApplicationRecord
    before_save { self.email_address = email_address.downcase }
    validates :name, :email_address, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email_address,
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  end
end
