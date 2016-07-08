class Skill < ApplicationRecord
  has_many :profile_skills
  has_many :profiles, through: :profile_skills

  enum category: [:craft, :tool, :application]

  def to_s
    name.gsub('-',' ').capitalize
  end
  
end
