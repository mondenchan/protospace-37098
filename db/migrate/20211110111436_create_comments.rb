class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content,           null: false
      t.string :prototype,         null: false 
      t.string :user,              null: false
      t.references :prototype, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
