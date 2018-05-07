require 'csv_importer/engine'
require 'test_helper'
require 'rake'

class CsvImporter::Test < ActiveSupport::TestCase
  setup do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'lib/tasks/app'
    # Rake.application.rake_require('people.csv', ["#{Rails.root}/people.csv"])
    Rake::Task.define_task(:environment)
  end

  setup do
    @rake[task].reenable # Reenable the task, allowing its tasks to be executed if the task is invoked again
  end

  test 'truth' do
    assert_kind_of Module, CsvImporter
  end

end

# rails test test/csv_importer_test.rb
# rails test lib/tasks/csv_importer_tasks_test.rb
