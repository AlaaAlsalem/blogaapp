class ChangeLikesCounterAndSetDefaults < ActiveRecord::Migration[7.1]
  def change
    
    change_column :posts, :LikesCounter,  'integer USING CAST("LikesCounter" AS integer)'

   
    change_column_default :posts, :LikesCounter, 0

   
    change_column_default :posts, :ComentsCounter, 0
  end
end