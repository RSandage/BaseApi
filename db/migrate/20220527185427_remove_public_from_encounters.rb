class RemovePublicFromEncounters < ActiveRecord::Migration[6.1]
  def change
    remove_column :encounters, :public
  end
end
