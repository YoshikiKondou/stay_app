class RoomsController < ApplicationController
  def posts
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def search
    if params[:search_area].present?
      @rooms = Room.where('rooms.address_building LIKE (?)', "%#{params[:search_area]}%")
    elsif params[:search_keyword].present?
      @rooms = Room.where('rooms.address_building LIKE (?) OR rooms.name LIKE (?) OR rooms.introduction LIKE (?)', "%#{params[:search_keyword]}%", "%#{params[:search_keyword]}%", "%#{params[:search_keyword]}%")
    else
      @rooms = Room.all
    end
  end

  def posts
    @rooms = Room.all
  end

  private

  def room_params
    params.require(:room).permit(
    :name,
    :introduction,
    :price,
    :address_building,
    :image_name,
    :person_num
    ).merge(user_id: session[:user_id])
  end

end
