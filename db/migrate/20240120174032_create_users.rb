class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :Name
      t.text :photo
      t.text :Bio
      t.string :PostCounter
      t.string :integer

      t.timestamps
    end
  end
end
