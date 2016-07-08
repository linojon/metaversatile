class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_skills, dependent: :destroy
  has_many :skills, through: :profile_skills

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
