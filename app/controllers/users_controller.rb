class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name],email: params[:email],password: params[:password])
    if @user.save
      session[:user_id] = @user.user_id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/profile")
    else
      render("users/sign_up")
    end
  end

  def sign_in
    @user = User.find_by(email: params[:email], password: params[:password])
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @email = params[:email]
      render("users/sign_in")
    end
  end

  def acount
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

end
