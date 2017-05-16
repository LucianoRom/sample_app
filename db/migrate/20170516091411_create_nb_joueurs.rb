class CreateNbJoueurs < ActiveRecord::Migration[5.0]
  def change
    create_table :nb_joueurs do |t|
      t.integer :number

      t.timestamps
    end
  end
end
