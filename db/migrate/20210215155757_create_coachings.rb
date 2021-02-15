class CreateCoachings < ActiveRecord::Migration[6.0]
  def change
    create_table :coachings do |t|
      t.date :coaching_date
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
