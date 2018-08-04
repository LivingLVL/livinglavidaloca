class UserController < ApplicationController
    
      before_action :authenticate_user!
      
    
    def login
        if current_user.admin?  # To prevent injection of url
            session[:login] = 1
            #session[:cart] = nil
            flash[:notice] = "Admin Login sucessfull!!"
            redirect_to :controller => :items
        else
            flash[:notice] = "You can't proceed this action. Unauthorized User"
            redirect_to :controller => :items
        end
    end 
    
    def logout
        if current_user.admin? # To prevent injection of url
            session[:login] = nil
            #session[:cart] = nil
            flash[:notice] = "You have been successfully logged out!!"
            redirect_to :controller => :items
        else
            flash[:notice] = "You can't proceed this action. Unauthorized User"
            redirect_to :controller => :items
        end
        
    end       
end
