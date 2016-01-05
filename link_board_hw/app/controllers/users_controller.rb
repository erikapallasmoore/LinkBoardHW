class UsersController < ApplicationController
   def new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save 
  		session[:user_id] = @user.user_id
  		flash[:success] = "User Created!"
  		redirect_to root_path
  	else
  		flash[:danger] = "Invalid User entry"
  		redirect_to "/signup"
  	end
  end

  private user_params
  	params.require(:user).permit(:email, :password)
  end
end
