class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      if URI(request.referer).path == '/impro_password'
        @user.send_password_reset_impro
      else
        @user.send_password_reset_email
      end
      if URI(request.referer).path == '/impro_password'
        flash[:info] = "Email envoyé"
        redirect_to matches_path
      else
        flash[:info] = "Email sent with password reset instructions"
        redirect_to root_url
      end
    else
      if URI(request.referer).path == '/impro_password'
        flash.now[:danger] = "Email non trouvé"
        redirect_to impro_password_path
      else
        flash.now[:danger] = "Email address not found"
        render 'new'
      end
    end
  end

  def edit
    if params[:type]=='impro'
      redirect_to impro_passreset_path(id: params[:id], email: params[:email])
    end
  end

  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "can't be empty")
      if (URI(request.referer).path.include? 'impro')
        redirect_to impro_passreset_path(id: params[:id], email: params[:email])
      else
        render 'edit'
      end
    elsif @user.update_attributes(user_params)          # Case (4)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset."
      if (URI(request.referer).path.include? 'impro')
        redirect_to matches_path
      else
        redirect_to @user
      end
    else
      if (URI(request.referer).path.include? 'impro')
        redirect_to impro_passreset_path(id: params[:id], email: params[:email])
      else
        render 'edit'
      end
    end
  end

  private


  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_user
    unless (@user && @user.activated? &&
            @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end
  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
end
