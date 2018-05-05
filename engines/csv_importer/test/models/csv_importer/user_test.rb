require 'test_helper'

module CsvImporter
  class UserTest < ActiveSupport::TestCase
    include Engine.routes.url_helpers

    def setup
      @user = User.new(
        name: 'Olaoluwa Afolabi',
        email_address: 'user@example.com',
        telephone_number: '09876 65433',
        website: 'www.myself.afolabiolaoluwa.com'
      )
    end

    test 'model should be valid' do
      assert @user.valid?
    end
  end
end
