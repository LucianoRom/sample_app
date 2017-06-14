class CreateArbitres < ActiveRecord::Migration[5.0]
  def change
    create_table :arbitres do |t|
      t.integer :match_id
      t.integer :user_id
      t.integer :selected

      t.timestamps
    end
  end
end
