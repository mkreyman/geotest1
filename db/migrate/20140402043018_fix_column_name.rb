class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :datasets, :name, :dataset_name
  end
end
