class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :data
      t.references :dataset, index: true

      t.timestamps
    end
  end
end
