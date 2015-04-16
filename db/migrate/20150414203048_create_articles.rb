class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :teaser
      t.text :content
      t.datetime :publish_at
      t.datetime :publish_until
      t.belongs_to :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
