class CreateRepresentants < ActiveRecord::Migration[5.0]
  def change
    create_table :representants do |t|
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.integer :selected

      t.timestamps
    end
  end
end
