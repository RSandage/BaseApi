module Api
  module V1
    class EncountersController < Api::V1::ApplicationController
      #POST /api/v1/encounters
      def create
        
        result = Encounters.new_encounter(encounter_params, @current_user)
        render_error(errors: "There was a problem creating a new encounter", status: 400) and return unless result.success?
        payload = {
          encounter: EncounterBlueprint.render_as_hash(result.payload, view: :normal)
        }
        render_success(payload: payload)
      end

      #PATCH/PUT /api/v1/encounters/:id
      def update
        result = Encounters.update_encounter(params[:id], encounter_params, @current_user)
        render_error(errors: "There was a problem updating the encounter", status: 400) and return unless result.success?
        payload = {
          encounter: EncounterBlueprint.render_as_hash(result.payload)
        }
        render_success(payload: payload)
      end

      #DELETE /api/v1/encounters/:id
      def delete
        result = Encounters.destroy_encounter(params[:id], @current_user)
        render_error(erros: "There was a problem deleting the encounter", status: 400) and return unless result.success?
        render_success(payload: nil)
      end

      #GET
      #user encounters - get current user encounters
      def my_encounters
      end

      private
        def encounter_params
          params.require(:encounter).permit(:title, :public)
        end
    end
  end
end
