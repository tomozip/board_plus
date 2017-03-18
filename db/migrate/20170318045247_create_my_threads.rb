class CreateMyThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :my_threads do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
