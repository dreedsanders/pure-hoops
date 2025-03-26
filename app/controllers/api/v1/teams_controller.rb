class Api::V1::TeamsController < ApplicationController
  # wrap_parameters :teams, include: [:user_id, :team_name]


  

  # GET /teams or /teams.json
  def index
    @teams = Team.all
    render json: @teams
  end


  # POST /teams or /teams.json
  def create
    @team={}
    @user={}
    if decode_token
      @user_id = decode_token[0]['user_id']
      @user = User.find_by(id: @user_id )
    end
    @team = Team.create(user_id: @user.id, team_name:team_params[:team_name], attribute_level: team_params[:attribute_level])
        render json: {team: @team, pic_attached: @user.profile_picture.attached?}
    end

  def update
    
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.permit(:user_id, :team_name, :attribute_level)
    end
end
