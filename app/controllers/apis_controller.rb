class ApisController < ApplicationController
  before_action :admin_user, only: [:create, :new, :destroy]

  def index
    @apis = Api.all
  end

  def show
    @api = Api.find(params[:id])
    redirect_to @api.address
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
      flash[:info] = "Api not createdi. issue with parameters"
      render 'new'
  end

  def destroy
    Api.find(params[:id]).destroy
    flash[:success] = "Api deleted"
    redirect_to root_url
  end

end
