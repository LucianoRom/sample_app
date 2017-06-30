class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      if params[:type]=='impro'
        flash[:success] = "Compte activé!"
        redirect_to matches_path
      else
        flash[:success] = "Account activated!"
        redirect_to root_url
      end
    else
      if params[:type]=='impro'
        flash[:danger] = "Lien d'activation non valide"
        redirect_to matches_path
      else
        flash[:danger] = "Invalid activation link"
        redirect_to root_url
      end
    end
  end
end
