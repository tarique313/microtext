class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :username
      t.integer :micropost_id

      t.timestamps
    end
  end
end
