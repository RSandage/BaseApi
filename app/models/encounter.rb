class Encounter < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true
  belongs_to :user
  has_many :events

  enum status: {
    priv: 0,
    pub: 1
  }
end
