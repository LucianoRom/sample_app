class AddTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :type, index: true
    add_foreign_key :users, :types
  end
end
