class UsersController < ApplicationController
    #GET request to  /user/:id
    def show
        @user = User.find(params[:id])
        
    end
end