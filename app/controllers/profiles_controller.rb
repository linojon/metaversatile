class ProfilesController < ApplicationController
  
  def show
    @user = User.find params[:user_id]
    @profile = @user.profile
  end

  def new
    @profile = Profile.new
  end

  def edit
    @user = User.find params[:user_id]
    @profile = @user.profile
  end
  
  def create
    @profile = Profile.new profile_params
#byebug
    if @profile.save || @profile.errors[':email'] == "has already been taken"
      # redirect_to edit_profile_path(@profile)
      redirect_to root_path, notice: 'Thank you for your interest in Meta.versatile'
    else
      render :new
    end
  end

  
  private
  
  def profile_params
    params.require(:profile).permit(:email, :first_name, :last_name)
  end
  
end
