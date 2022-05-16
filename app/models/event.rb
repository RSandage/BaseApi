class Event < ApplicationRecord
  validates :name, presence :true
  validates :description, presence :true
  belongs_to :encounter
end
