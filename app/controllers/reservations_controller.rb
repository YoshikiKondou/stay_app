class ReservationsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @reservations = Reservation.all
  end

  def new
    @user = User.find(session[:user_id])
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
    @reservation.start_at = Date.parse(params[:start_at])
    @reservation.end_at = Date.parse(params[:end_at])
    @room.person_num = params[:person_num]
    @days = (@reservation.end_at.to_date - @reservation.start_at.to_date).to_i
    @total = (@days * @room.price * @room.person_num).to_i
  end

  def create
    @user = User.find(session[:user_id])
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @room = Room.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(
    :start_at,
    :end_at,
    :total_price,
    :room_id
    )
  end
end
