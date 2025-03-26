class Api::V1::PlayersController < ApplicationController
  # before_action :set_player, only: %i[ show edit update destroy ]
  wrap_parameters false

  # GET /players or /players.json
  def index
    @players = Player.all
    render json: @players
  end

  # GET /players/1 or /players/1.json
  def show
    @player= Player.find(params[:id])
    team = @player.team
    render json: {player: @player, team: team}
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    # byebug
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id )
    end
    player= Player.find(params[:id])
    player.update(player_params)
    players=Player.all
    render json: {user: @user,user_team: @user.team, player: player, players: players, user_team_players: @user.team.players}
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_path, status: :see_other, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.permit(:id, :name, :position, :jersey, :height, :weight, :team_id)
    end
end
