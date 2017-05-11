class CreateApis < ActiveRecord::Migration[5.0]
  def change
    create_table :apis do |t|
      t.string :api_name
      t.string :picture
      t.string :address

      t.timestamps
    end
    add_index :apis, :api_name, unique: true
  end
end
