class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :articles, :categories
  end
end
