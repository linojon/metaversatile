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

  bio = 
%Q{
<p>Professional software developer and product manager with over 20 years hands-on entrepreneurial experience. Active virtual reality evangelist, code mentor, and podcaster.</p>

<p>My latest interests are Virtual Reality and related development. I authored the book "Unity Virtual Realty Projects"​ (http://www.amazon.com/dp/178398855X) and "Cardboard VR Projects for Android" (https://www.packtpub.com/application-development/cardboard-vr-projects-android). Host of "Uncle Jonny's Virtual Reality Podcast"​ available on iTunes and Stitcher (http://unclejonny.com)</p>

<p>Expertise with a broad range of software, 3D and Internet technologies, including Unity3D, Ruby on Rails, Linux and more.</p>
}
  jl = User.create email: 'jonathan@parkerhill.com', password: 'secret123', password_confirmation: 'secret123', 
    profile_attributes: { email: 'jonathan@parkerhill.com', username: 'linojon', first_name: 'Jonathan', last_name: 'Linowes', headline: 'Agile applications development', industry: 4, bio: bio }
  jl.profile.social_networks.create name: 'LinkedIn', handle: 'linojon'
  jl.profile.social_networks.create name: 'Twitter', handle: '@linojon'

  project = Project.create name: "Reality, Virtually Hackathon", description: "VR/AR/MR Hackathon at the MIT Media Lab, Oct. 7-9, 2016"
  jl.projects << project
  team = project.teams.create name: 'Mentors', description: 'Hackathon mentors'
  jl.teams << team
end
