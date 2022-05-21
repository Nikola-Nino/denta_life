class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :full_name
      t.date :date_of_visit
      t.string :diagnosis
      t.string :treatment
      t.string :special_conditions_and_additional_notes

      t.timestamps
    end
  end
end
