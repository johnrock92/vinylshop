class ApplicationController < ActionController::Base
  
  protect_from_forgery

  include ApplicationHelper

  #before_filter :authorise, :except => :index


  #add any public methods below

  def authorise
        unless signed_in?
           store_location
           redirect_to signin_path, :notice => "Please sign in to access this page."
        end
  end

   def store_location
       session[:return_to] = request.fullpath
   end
 

  #private methods start here

  private

  def current_cart
  	cart = Cart.find_by_id(session[:cart_id])
  	if cart.nil?
  		cart = Cart.create
  		session[:cart_id] = cart_id
  	end
  	cart #return the cart object
  end

  
  def addVinyl(vinyl,cart)
  	current_item = lineitems.find_by_vinyl_id(vinyl.id)

  	if current_item
  		current_item.quantity = current_item.quantity +1
  	else
  		current_item = cart.lineitems.create(vinyl_id: vinyl_id)
  		current_item.quantity = 1
  	end
  	current_item
  end

end
