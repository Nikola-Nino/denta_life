class AddUserToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_reference :treatments, :user, foreign_key: true
  end
end
