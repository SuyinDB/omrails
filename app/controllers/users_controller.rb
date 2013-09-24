class UsersController < ApplicationController
  def show

  	if params[:id].nil? # if there is no user id in params, show current one
    	@user = current_user
  	else
  		@user = User.find(params[:id])
  	end
    @pins = @user.pins.page(params[:page]).per_page(20)
  end
end
