class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  before_create :default_profile

  has_many :project_memberships, dependent: :destroy
  has_many :projects, through: :project_memberships

  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships

  def default_profile
    if profile.nil?
      self.build_profile email: email
    end
  end
  
end
