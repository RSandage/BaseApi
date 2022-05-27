class AddStatusToEncounters < ActiveRecord::Migration[6.1]
  def change
    add_column :encounters, :status, :integer, default:0
  end
end
