class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  if params[:type_id].present?
    @user.type_id = params[:type_id]
    @user.save
  end

  @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to "/home"  and return unless @user.activated?


  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      if URI(request.referer).path == '/signup_impro'
        @user.send_activation_impro
      else
        @user.send_activation_email
      end

      if URI(request.referer).path == '/signup_impro'
      flash[:info] = "Un lien d'activation a été envoyé par email."
        redirect_to matches_path
      else
      flash[:info] = "Please check your email to activate your account."
        redirect_to "/home"
      end
    else
      if URI(request.referer).path == '/signup_impro'
      flash[:info] = "Erreur dans le formulaire"
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
      if URI(request.referer).path == '/profil_impro'
      flash[:success] = "Profil mis à jour"
        redirect_to matches_path
      else
      flash[:success] = "Profile updated"
        redirect_to @user
      end
    else
      if URI(request.referer).path == '/profil_impro'
      flash[:danger] = "erreurs dans le formulaire"
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
