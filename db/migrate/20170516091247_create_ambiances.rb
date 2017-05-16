class CreateAmbiances < ActiveRecord::Migration[5.0]
  def change
    create_table :ambiances do |t|
      t.string :name

      t.timestamps
    end
  end
end
