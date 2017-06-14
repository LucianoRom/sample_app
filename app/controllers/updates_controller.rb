class UpdatesController < ApplicationController
  before_action :admin_user, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_update, only: [:show, :edit, :update, :destroy]

  # GET /updates
  # GET /updates.json
  def index
    @updates = Update.all
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
  end

  # GET /updates/new
  def new
    @update = Update.new
  end

  # GET /updates/1/edit
  def edit
  end

  # POST /updates
  # POST /updates.json
  def create
    @update = Update.new(update_params)

    respond_to do |format|
      if @update.save
        format.html { redirect_to updates_url, notice: 'Update was successfully created.' }
        format.json { render :index, status: :created, location: @update }
      else
        format.html { render :new }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /updates/1
  # PATCH/PUT /updates/1.json
  def update
      if @update.update(update_params)
        redirect_to updates_path
      else
        render :edit
      end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update.destroy
    respond_to do |format|
      format.html { redirect_to updates_url, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = Update.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:update).permit(:detail, :status)
    end
end
