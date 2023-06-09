class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.text :comment, null: false
      t.float :score, null: false, default: 0
      t.timestamps
    end
  end
end


