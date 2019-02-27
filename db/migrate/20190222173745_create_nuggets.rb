class CreateNuggets < ActiveRecord::Migration[5.2]
  def change
    create_table :nuggets do |t|
      t.string :title
      t.string :img_url
      t.string :video_url
      t.string :question
      t.text :body
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
