class Types < ActiveRecord::Migration[5.0]
  def change
     create_table :types
     add_column :types, :name, :string, :default => 0


  end
end
