class SessionimprosController < ApplicationController
  def new
  end

  def newuser
@user = User.new
  end

  def edituser
@user = current_user
  end
end
