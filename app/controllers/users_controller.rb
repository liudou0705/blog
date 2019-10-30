class UsersController < ApplicationController
  def index
   # if params[:name]
  #    @users = User.where("name  LIKE :name", name: "%#{params[:name]}%")
  # else
  #    @users = User.all
  #  end
  #  #@users = User.where(sex: params[:sex])

    @q = User.ransack(params[:q])
    @users = @q.result

  end

  def print

  end

  def signup
    @user = User.new
  end



  def logout
    session[:user_id] = nil
    redirect_to :root
  end

  def create
    @user = User.new(user_params)
    if @user.save
          cookies[:auth_token] = @user.auth_token
          redirect_to :root
    else
          render :signup
    end
  end

  def login

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find_by_id(params[:id])
    user.update_attributes!(user_params)
    redirect_to :users
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to :users
  end



  def create_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = "登陆成功！"
      redirect_to :root
    else
      flash.notice = "用户名密码错误!"
      redirect_to :login
    end
  end

  def show
    @user = User.find params[:id]
    @name = "这是一个在show定义的名字"
    @comments = "这是一个在show评论"
 #   @password = User.find params[:password_digest]
  end


  private
    def user_params
      params.require(:user).permit!
    end
end
