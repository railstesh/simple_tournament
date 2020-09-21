class Team < ApplicationRecord

  has_many :team_players, inverse_of: :team

  belongs_to :tournament

  enum status: %i[pending approved rejected]

  validates :name, :status, presence: true
  validates :team_players, length: { maximum: 2 }

  accepts_nested_attributes_for :team_players, reject_if: lambda {|attributes| attributes['user_id'].blank?}


  before_create :default_status

  private
    def default_status
      self.status = :pending
    end
end
