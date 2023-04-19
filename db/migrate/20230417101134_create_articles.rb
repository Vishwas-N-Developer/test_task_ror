class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :cover
      t.string :tags
      t.string :category_id
      t.references :author, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end