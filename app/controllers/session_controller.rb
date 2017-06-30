class SessionController < ApplicationController

  def new
  end


  def create
    if params[:session][:name].present?
      @user = User.find_by(name: params[:session][:name])
    else
      @user = User.find_by(email: params[:session][:email].downcase)
    end
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        if URI(request.referer).path == '/login_impro'
          redirect_back_or matches_path
        else
          redirect_back_or @user
        end
      else

        if URI(request.referer).path == '/login_impro'
        message  = "Compte non activé. "
        message += "Merci d'utiliser le lien d'activation envoyé par email."
        flash[:warning] = message
          redirect_to matches_patch
        else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
          redirect_to root_url
        end
      end
    else

      if URI(request.referer).path == '/login_impro'
      flash.now[:danger] = 'login/email ou mot de passe invalide'
        redirect_to login_impro_path
      else
      flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy

    if !(URI(request.referer).path.include? 'match' )
      if !(URI(request.referer).path.include? 'impro')
        log_out if logged_in?
        redirect_to root_url
      else
        log_out if logged_in?
        redirect_to matches_url
      end
    else
      log_out if logged_in?
      redirect_to matches_url
    end
  end
end
