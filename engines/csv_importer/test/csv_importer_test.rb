require 'test_helper'
require 'rake'
require 'uri'

class Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, CsvImporter
  end

  test 'override_application' do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake::Task.define_task(:environment)
    assert_equal @rake, Rake.application
  end

  test 'should import data' do
    WebImport.new(url: 'http://assets.cahootify.com/recruitment/people.csv').call
    assert :success
  end
end
