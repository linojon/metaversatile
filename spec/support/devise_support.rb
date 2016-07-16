# ref https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara

def sign_in(user)
  login_as user, scope: :user
  user.confirmed_at = Time.now
  user.save
end

def sign_out
  logout :user
end
