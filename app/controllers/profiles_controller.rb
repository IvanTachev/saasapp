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
            redirect_to root_path
        else
            render action: :new
        end
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end

end