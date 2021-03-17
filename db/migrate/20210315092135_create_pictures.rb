class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string  :text
      t.string  :account
      t.integer :user_id
      t.timestamps
    end
  end
end
