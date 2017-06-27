class SessionController < ApplicationController

  def new
  end


  def create
    @user = User.find_by(email: params[:session][:email].downcase)
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
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
      if URI(request.referer).path == '/login_impro'
          redirect_to matches_patch
        else
          redirect_to root_url
        end
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      if URI(request.referer).path == '/login_impro'
        redirect_to '/login_impro'
      else
      render 'new'
      end
    end
  end

  def destroy

   if !(URI(request.referer).path.include? 'match' )
     if !(['/login_impro','/signup_impro', '/profil_impro'].include? URI(request.referer).path)
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
