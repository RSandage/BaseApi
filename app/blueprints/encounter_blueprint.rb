class EncounterBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :status

  view :normal do
    fields :created_at, :updated_at
  end
end