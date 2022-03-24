class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to("/users/profile")
    else
      flash[:failure] = "ユーサー登録できませんでした"
      render("users/sign_up")
    end
  end

  def sign_in
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/")
    else
      @user = User.new
      flash[:failure] = "ログインできませんでした"
      @email = params[:email]
      render("users/sign_in")
    end
  end

  def acount
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to("/")
    else
      flash[:failure] = "ユーザー情報を更新できませんでした"
      render :edit
    end
  end

    

  def profile
    @user = User.find(session[:user_id])
  end

  def renewal
    @user = User.find(session[:user_id])
    @user.image_name = params[:user][:image_name] if params[:user][:image_name].present?
    @user.name = params[:user][:name]
    @user.introduction = params[:user][:introduction]
    if @user.image_name.present?
      if @user.save(validate: false)
        flash[:success] = "ユーザー情報を更新しました"
        redirect_to("/")
      else
        flash[:failure] = "ユーザー情報を更新できませんでした"
        render :profile
      end
    else
      flash[:failure] = "画像を入れてください"
      render :profile
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/")
  end

  private

  def user_params
    params.require(:user).permit(
    :name,
    :email,
    :image_name,
    :password,
    :password_confirmation,
    :introduction
    )
  end

end
