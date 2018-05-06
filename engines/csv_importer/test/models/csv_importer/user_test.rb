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

    test 'name should be present' do
      @user.name = ''
      assert_not @user.valid?
    end

    test 'email should be present' do
      @user.email_address = ''
      assert_not @user.valid?
    end

    test 'email addresses should be unique' do
      duplicate_user = @user.dup
      duplicate_user.email_address = @user.email_address.upcase
      @user.save
      assert_not duplicate_user.valid?
    end

    test 'email addresses should be saved as lower-case' do
      mixed_case_email = 'Foo@ExAMPle.CoM'
      @user.email_address = mixed_case_email
      @user.save
      assert_equal mixed_case_email.downcase, @user.reload.email_address
    end
  end
end
