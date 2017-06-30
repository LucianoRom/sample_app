class SessionimprosController < ApplicationController
  def new
  end

  def pass_perdu

  end

  def pass_reset
     @user = User.find_by(email: params[:email])
  end
  def newuser
@user = User.new
  end

  def edituser
@user = current_user
  end
end
