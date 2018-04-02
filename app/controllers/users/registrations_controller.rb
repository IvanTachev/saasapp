class Users::RegistrationsController < Devise::RegistrationsController
    #Extend dafault Devise gem behavior
    #so users can sign up with pro plan
    #with special function.
    def create
        super do |resource|
            if params[:plan]
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    resource.save_with_subscription
                else
                    resource.save
                end
            end
        end
    end
end