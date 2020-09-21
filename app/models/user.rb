class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :team_players, inverse_of: :user

  after_create :default_role

  private
    def default_role
      self.roles << Role.find_by_name("user")
      self.save
    end
end
