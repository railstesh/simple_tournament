class Team < ApplicationRecord

  has_many :team_players, inverse_of: :team

  belongs_to :tournament

  enum status: %i[pending approved rejected]

  validates :name, :status, presence: true
  validates :team_players, length: { maximum: 5, message: "only 5 player allowed" }
  validates_associated :team_players

  accepts_nested_attributes_for :team_players, reject_if: lambda {|attributes| attributes['user_id'].blank?}


  before_validation :default_status, on: :create

  private
    def default_status
      self.status = :pending
    end
end
