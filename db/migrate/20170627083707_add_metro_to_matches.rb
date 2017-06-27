class AddMetroToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :metro, :string
  end
end
