class CreateNuggetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :nugget_tags do |t|
      t.references :nugget, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
