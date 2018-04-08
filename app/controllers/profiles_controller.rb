class ProfilesController < ApplicationController

    #When user makes GET to /users/user_id/profile/new
    def new
       #Render a blank profile details 
       @profile = Profile.new
    end
    
    def create
        #POST to users/:user_id/profile
        #Ensure we have the correct user
        @user = User.find(params[:user_id])
        #Create link to the profile of that user
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profile updated"
            redirect_to user_path(params[:user_id])
        else
            render action: :new
        end
    end
    
    #GET request for /users/:user_id/profile/edit
    def edit
        @user = User.find(params[id: :user_id])
        @profile = @user.profile
    end
    
    #PATCH to /users/:user_id/profile
    def update
        @user = User.find(params[:user_id])
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
           flash[:success] = "Profile updated"
           redirect_to user_path(id: params[:user_id])
        else
            redner action :edit
        end
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end

end