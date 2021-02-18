class AddTextDescriptionToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :text_description, :text
  end
end
