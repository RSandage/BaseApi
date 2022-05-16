class Encounter < ApplicationRecord
  validates :title, presence :true
  validates :public, presence :true
  belongs_to :user
  has_many :events
end
