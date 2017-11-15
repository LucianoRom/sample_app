class AddCommentToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :comment, :string
  end
end
