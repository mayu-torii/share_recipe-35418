module UsersHelper

  def show
    @users = User.find(params[:id])
  end  

end
