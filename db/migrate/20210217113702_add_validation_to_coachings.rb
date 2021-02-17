class AddValidationToCoachings < ActiveRecord::Migration[6.0]
  def change
    add_column :coachings, :validation, :integer, null: false, default: 0
  end
end
