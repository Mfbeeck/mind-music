module UsersHelper

	private
	  def user_params
	    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :admin)
	  end
end
