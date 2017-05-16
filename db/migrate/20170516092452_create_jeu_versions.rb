class CreateJeuVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :jeu_versions do |t|
      t.references :game, foreign_key: true
      t.references :version, foreign_key: true

      t.timestamps
    end
  end
end
