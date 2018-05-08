require 'jquery-rails'
require 'rails-controller-testing'
require 'open-uri'
require 'csv'
require 'capybara'
require 'byebug'

module CsvImporter
  class Engine < ::Rails::Engine
    isolate_namespace CsvImporter

    # This enables me to be able to correctly migrate the database from the parent application.
    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s)
        config.paths['db/migrate'].expanded.each do |p|
          app.config.paths['db/migrate'] << p
        end
      end
    end
  end

end
