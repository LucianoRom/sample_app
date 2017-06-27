class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to "/home"  and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      if URI(request.referer).path == '/signup_impro'
        redirect_to matches_path
      else
        redirect_to "/home"
      end
    else
      flash[:info] = "Erreur dans le formulaire"
      if URI(request.referer).path == '/signup_impro'
        redirect_to signup_impro_path
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # success
      flash[:success] = "Profile updated"
      if URI(request.referer).path == '/profil_impro'
        redirect_to matches_path
      else
        redirect_to @user
      end
    else
      if URI(request.referer).path == '/profil_impro'
        redirect_to profil_impro_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :type_id)
  end
  # Before filters


  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to('/home') unless current_user?(@user)
  end


end
