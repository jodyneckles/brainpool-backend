class AddCompletedToUserNugget < ActiveRecord::Migration[5.2]
  def change
    add_column :user_nuggets, :completed, :boolean, default: false
  end
end
