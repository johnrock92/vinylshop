class SessionsController < ApplicationController
  def new
  end

  def create
   customer = Customer.find_by_name(params[:name])	
   if customer && customer.authenticate(params[:password]) 			
   session[:customer_id] = customer.id	#stores the id in the session 	
   redirect_to customer	#displays the user/show view
   else  	 		
	flash.now[:error] = "Invalid name/password combination."      	
	render 'new'		           #shows the signin page again 
    end
 end


  def destroy
	if signed_in?
		session[:customer_id] = nil					
	else
		flash[:notice] = "You need to sign in first"			
	end
	redirect_to signin_path
 end

end
