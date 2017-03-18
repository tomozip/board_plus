class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :my_thread_id
      t.string :body
      t.references :my_thread, foreign_key: true

      t.timestamps
    end
  end
end
