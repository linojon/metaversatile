# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

## default skills
{ craft: %w{ Level-design 3D-modeling Game-mechanics Audio-music-sound User-interface-experience Narrative-story-telling 360-degree-media Project-management Marketing Virtual-reality Augmented-reality Mixed-reality },

  tool: %w{ 
    Unity-engine Unreal-engine Cryengine 
    WebVR A-Frame 
    Blender Maya 3D-Studio-Max
    Windows OSX Linux iOS Android Playstation XBox
    Google-cardboard GearVR Oculus-Rift HTC-Vive
    Hololens Meta2
    C# Java C++ Javascript Python Ruby  
    }, 
  application: %w{ Games Journalism Cinema Education Travel-Hospitality Engineering Architecture Medical Business-economics Military-First-repsonder Research }
}.each do |category, skills|
  skills.each do |skill|
    Skill.create category: category, name: skill
  end
end


if Rails.env.development?
  crafts = Skill.craft
  tools = Skill.tool
  applications = Skill.application
  skills = Skill.all

  1.upto(5).each do |i|
    user = User.create email: "user#{i}@example.com", password: 'secret123', password_confirmation: 'secret123'
    user.profile.profile_skills.build skill: crafts.sample
    user.profile.profile_skills.build skill: tools.sample
    user.profile.profile_skills.build skill: applications.sample
    user.profile.profile_skills.build skill: skills.sample
    user.profile.profile_skills.build skill: skills.sample
    user.profile.save
  end

end
