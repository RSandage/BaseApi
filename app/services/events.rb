module Events
  def self.new_event(params, current_encounter)
    event = current_encounter.events.new(params)
    return ServiceContract.error("Error saving event") unless event.save
    ServiceContract.success(event)
  end

  def self.update_event(event_id, params, current_encounter)
    event = current_encounter.events.find(event_id)
    return ServiceContract.error("Error updating event") unless event.update(params)
    ServiceContract.success(event)
  end

  def self.destroy_event(event_id, current_encounter)
    event = current_encounter.events.find(event_id)
    ServiceContract.error("Error deleting event") and return unless event.destroy
    ServiceContract.success(payload: nil)
  end
end