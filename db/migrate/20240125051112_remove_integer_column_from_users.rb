class RemoveIntegerColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :integer
  end
end
