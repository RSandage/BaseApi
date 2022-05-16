module Encounters
  def self.new_encounter(params, current_user)
    encounter = current_user.encounter.new(params)
    return ServiceContract.error("Error saving the encounter") unless encounter.save
    ServiceContract.success(encounter)
  end

  def self.update_encounter(encounter_id, params, current_user)
    encounter = current_user.encounter.find(encounter_id)
    return ServiceContract.error("Error updating encounter") unless encounter.update(params)
    ServiceContract.success(encounter)
  end

  def self.destroy_encounter(encounter_id, current_user)
    encounter = current_user.encounter.find(encounter_id)
    ServiceContract.error("Error deleting the encounter") and return unless encounter.destroy
    ServiceContract.success(payload: nil)
  end
end