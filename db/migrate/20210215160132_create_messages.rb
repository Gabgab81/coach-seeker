class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coaching, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
