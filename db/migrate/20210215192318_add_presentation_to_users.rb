class AddPresentationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :presentation, :text, null: false
  end
end
