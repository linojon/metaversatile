class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_skills, dependent: :destroy
  has_many :skills, through: :profile_skills
  has_many :social_networks, dependent: :destroy

  accepts_nested_attributes_for :social_networks, reject_if: :all_blank, allow_destroy: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
              presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 254 },
              format: { with: VALID_EMAIL_REGEX }


  def full_name
    "#{first_name} #{last_name}"
  end

end
