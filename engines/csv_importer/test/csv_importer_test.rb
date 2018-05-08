require 'csv_importer/engine'
require 'test_helper'
require 'rake'

module CsvImporter
  class Test < ActiveSupport::TestCase
    include Engine.routes.url_helpers

    test 'truth' do
      assert_kind_of Module, CsvImporter
    end

    test 'should override_application and import data' do
      a = WebImport.new(url: 'http://assets.cahootify.com/recruitment/people.csv')
      a.string_to_users('Olaoluwa Afolabi')
      assert_equal User.count, 2
    end
  end
end

