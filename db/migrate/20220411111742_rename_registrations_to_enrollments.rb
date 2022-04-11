class RenameRegistrationsToEnrollments < ActiveRecord::Migration[6.1]
  def change
    rename_table :registrations, :enrollments
  end
end
