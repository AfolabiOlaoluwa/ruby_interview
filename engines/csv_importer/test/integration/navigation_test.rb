require 'test_helper'

module CsvImporter
  class NavigationTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    def setup
      @user = csv_importer_users(:one)
    end

    test 'browse site index' do
      https!
      get users_path
      assert_template 'users/index'
    end

    test 'unsuccessful edit' do
      get edit_user_path(@user)
      assert_template 'users/edit'
      patch user_path(@user), params: {
        user: { name:  'Stone Cold',
                email_address: 'foo@invalid', # This should make the test pass because the email is not valid.
                telephone_number: '09876 65433',
                website: 'www.myself.afolabiolaoluwa.com' }
      }

      assert_template 'users/edit'
    end
  end
end
