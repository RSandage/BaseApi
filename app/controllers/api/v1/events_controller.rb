module Api
  module V1
    class EventsController < ApplicationController
      #POST /api/v1/events
      def create
        result = Events.new_event(event_params, @current_encounter)
        render_error(errors: "There was a problem creating a new event", status: 400) and return unless result.success?
        payload = {
          event: EventBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end

      #PATCH/PUT /api/v1/events/:id
      def update
        result = Events.update_event(params[:id], event_params, @current_encounter)
        render_error(errors: "There was a problem updating the event", status: 400) and return unless result.success?
        payload = {
          event: EventBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end

      #DELETE /api/v1/events:id
      def delete
        result = Events.destroy_event(event_id, current_encounter)
        render_error(errors: "There was a problem deleting the event", status: 400) and return unless result.success?
        render_success(payload: nil)
      end

      private
        def event_params
          params.require(:event).permit(:name, :description)
        end
    end
  end
end
