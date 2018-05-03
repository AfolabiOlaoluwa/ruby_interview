class CreateCsvImporterUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :csv_importer_users do |t|
      t.string :name
      t.string :email_address
      t.integer :telephone_number
      t.string :website

      t.timestamps
    end
  end
end
