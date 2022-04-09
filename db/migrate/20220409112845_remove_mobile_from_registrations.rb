class RemoveMobileFromRegistrations < ActiveRecord::Migration[6.1]
  def change
    remove_column :registrations, :mobile, :string
  end
end
