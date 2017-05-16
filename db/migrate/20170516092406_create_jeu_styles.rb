class CreateJeuStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :jeu_styles do |t|
      t.references :game, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
