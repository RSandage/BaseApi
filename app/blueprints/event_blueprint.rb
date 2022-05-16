class EventBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :description

  view :normal do
    fields :created_at, :updated_at
  end
end