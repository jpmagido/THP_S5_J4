class UsersController < ApplicationController
  def show
 @id_user = params[:id]
 @id_city = City.find(User.find(params[:id]).city_id)


  end

  def new
  	@user = User.new
  end

  def create
  	u = User.create(first_name: "#{params[:user][:first_name]}",
  		last_name: "#{params[:user][:last_name]}",
  		description: "#{params[:user][:description]}",
  		email: "#{params[:user][:email]}",
  		age: "#{params[:user][:age]}",
  		city_id: "#{params[:user][:city_id]}", 
  		password: "#{params[:user][:password]}")

  	if u.errors.full_messages == []
  		redirect_to user_path(User.last.id)
  	end

  end
end
