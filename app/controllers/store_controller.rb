include ActionView::Helpers::TextHelper
class StoreController < ApplicationController
 def increment_access_count
 	if session[:counter].nil? 
 		session[:counter] = 1
 	else
 		session[:counter] += 1
 		if session[:counter] >= 5
 			@show_message = "Page loaded " + pluralize(session[:counter], ' time')
 		end
 	end
 	
  end

  def index
  	increment_access_count
  	@products = Product.order(:title)
  end
end
