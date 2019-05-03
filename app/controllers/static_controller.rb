class StaticController < ApplicationController
  
  def team
  end

  def contact
  end

  def home_id
  puts "$" * 60 
  puts params[:id]
  puts "$" * 60

  @user = params[:id]	
  end


  def home
  	
  end

end

