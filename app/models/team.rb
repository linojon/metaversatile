class Team < ApplicationRecord
  belongs_to :project
  has_many :team_memberships, dependent: :destroy
  has_many :teammates, through: :team_memberships, source: :user
end
