class LoginsController < ApplicationController

    def new
    end
    
    def login
        @current_user = User.authenticate(params[:login], params[:password])
        if @current_user
            if @current_user.activated
                session[:user_id] = @current_user.id
                flash[:notice]  = "Login successful"
                if session[:return_to]
                    redirect_to session[:return_to]
                    session[:return_to] = nil
                else
                    redirect_to :action => 'logged_in'
                end
            else
                flash[:warning]="Your account is not activated"
                render :action => 'login'
            end
        else
            flash[:warning] = "No such user"
            render :action => 'login'
        end
    end
    
    def logout
        @current_user = session[:user_id] = nil
        flash[:notice] = 'Logged out'
        redirect_to :action => 'logged_out'
    end
    
    def logged_in
    end
    
    def logged_out
    end
     def index
     end
    end