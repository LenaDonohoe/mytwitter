class UsersController < ApplicationController
  def show
        @user = User.find(params[:id])
	end
	def new
		 @user = User.new
	end
 def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
          flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
           # Handle a successful save.
            redirect_to @user   # NEW LINE
        else
            render 'new'     # NEW LINE      # Handle an unsuccessful save.     
        end
  end
end
