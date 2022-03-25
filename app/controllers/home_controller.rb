class HomeController < ApplicationController

  def top
    @users = User.all
    @rooms = Room.all
  end

end
