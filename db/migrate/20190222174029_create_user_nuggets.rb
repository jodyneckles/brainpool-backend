class CreateUserNuggets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_nuggets do |t|
      t.references :user, foreign_key: true
      t.references :nugget, foreign_key: true

      t.timestamps
    end
  end
end
