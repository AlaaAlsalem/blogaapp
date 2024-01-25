class ChangeUserTable < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.change :name, :text
      t.change :photo, :text
      t.change :bio, :text
      t.change :post_counter, :'integer USING CAST("post_counter" AS integer)'
      
     
 
    end
  end
end
