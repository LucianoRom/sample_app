class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :new, :create, :destroy, :subscribe]
  before_action :correct_user_or_admin_impro, only: [:edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all.sort_by &:date
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_url, notice: 'Match was successfully created.' }
        format.json { render :index, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to matches_url, notice: 'Match was successfully updated.' }
        format.json { render :index, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select
      # on récupère les paramètres de classe, user et match et on règle "selected"
      @objet = params["class"].constantize.find_by(user_id: params["user_id"], match_id: params["match_id"])
      @objet.selected = 1
      @objet.save
        redirect_to matches_url
  end

  def deselect
      # on récupère les paramètres de classe, user et match et on règle "selected"
      @objet = params["class"].constantize.find_by(user_id: params["user_id"], match_id: params["match_id"])
      @objet.selected = 0
      @objet.save
        redirect_to matches_url
  end

  def subscribe
    #pour simplifier la gestion des paramètre : on supprime tout les liens du user et on les remet
    ##
    Adversaire.where(:user_id => current_user.id, :selected => 0).destroy_all
    Musique.where(:user_id => current_user.id, :selected => 0).destroy_all
    Arbitre.where(:user_id => current_user.id, :selected => 0).destroy_all
    Mc.where(:user_id => current_user.id, :selected => 0).destroy_all
    Jury.where(:user_id => current_user.id, :selected => 0).destroy_all
    Representant.where(:user_id => current_user.id, :selected => 0).destroy_all
    #
    #
    #décomposer le résultat du formulaire ici. On récupère la première partie du nom de la checkbox pour obtenir le type, puis on cherche le croisement entre le user id et l'objet id. On l'ajoute s'il existe pas et qu'on a 1 dans la checkbox, et on l'enlève sinon
    #pour checkbox = adversaire_XX = YY
    #@objet = Adversaire.find_by user_id:@current_user, match_id: XX

    #if YY = "on"
    #   if objet?
    #   else
    #      Adversaire.new(match_id: XX, user_id: @current_user, selected: 0)
    #   end
    #else
    #   @objet.destroy if @objet?
    #   end
    params.each do |param, value|
      if value == "on"
        # param => typeobjet_numero
        @parampl = param.split('_')
        @type = @parampl[0]
        @number = @parampl[1]
        #constantize transforme un string en la classe correspondante (si elle existe), mais il faut d'abord ajouter une majuscule à la variable
        @objet = @type.capitalize.constantize.find_by user_id: current_user.id, match_id: @number
        @newrecord = @type.capitalize.constantize.new(match_id: @number, user_id: current_user.id, selected: 0)
        @newrecord.save
      end
    end
    redirect_to matches_url, notice: 'Inscriptions enregistrées'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def match_params
    params.require(:match).permit(:date, :salle, :ville, :orga, :metro)
  end
  def correct_user_or_admin_impro
    @match = Match.find(params[:id])
    @user = @match.organisateur
    redirect_to('/matchs') unless current_user?(@user)||impro_admin?(current_user)
  end
end
