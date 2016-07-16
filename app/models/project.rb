class Project < ApplicationRecord
  has_many :project_memberships, dependent: :destroy
  has_many :members, through: :project_memberships, source: :user
  has_many :teams, dependent: :destroy
end
