class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :localisation
      t.references :user, null: false, foreign_key: true
      t.string :discipline

      t.timestamps
    end
  end
end
