class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if (URI(request.referer).path.include? 'match' )
      @micropost.content = "#improvisades "+@micropost.content
    end
    if @micropost.save
      if (URI(request.referer).path.include? 'match' )
        redirect_to matches_path(anchor: 'comments')
      else
        flash[:success] = "Micropost created!"
        redirect_to '/home'
      end
    else
      @feed_items = []
      if (URI(request.referer).path.include? 'match' )
        redirect_to '/home'
      else
        render 'static_pages/home'
      end
    end
  end

  def destroy
    @micropost.destroy
    if (URI(request.referer).path.include? 'match' )
      flash[:success] = "Commentaire supprimé"
      redirect_back(fallback_location: '/matches')
    else
      flash[:success] = "Micropost deleted"
      redirect_back(fallback_location: '/home')
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
