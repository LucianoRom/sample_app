class ApisController < ApplicationController
  before_action :admin_user, only: [:create, :new, :destroy, :edit, :update]
  before_action :set_api, only:[:edit, :update, :destroy]

  def index
    @apis = Api.all
  end

  def new
    @api = Api.new
  end

  def create
    @api = Api.new(api_params)
    if @api.save
      flash[:info] = "Api created"
      redirect_to root_url
    else
      flash[:info] = "Api not created. issue with parameters"
      render 'new'
    end
  end

  def destroy
    @api.destroy
    flash[:success] = "Api deleted"
    redirect_to root_url
  end

  def edit
  end

  def update
    if @api.update(api_params)
    # success
      flash[:success] = "Api updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def set_api
    @api = Api.find(params[:id])
  end

  def api_params
    params.require(:api).permit(:api_name, :address, :apicture, :active)
  end
end
