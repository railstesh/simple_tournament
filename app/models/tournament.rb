class Tournament < ApplicationRecord
  enum status: %i[upcoming running finished]

  validates :name, :status, presence: true
end
