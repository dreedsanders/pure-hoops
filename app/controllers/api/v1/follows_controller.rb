class Api::V1::FollowsController < ApplicationController
  # before_action :set_follow, only: %i[ show edit update destroy ]

  # GET /follows or /follows.json
  def index
    @follows = Follow.all
    render json: {follows: @follows}
  end

  # GET /follows/1 or /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows or /follows.json
  def create
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id )
      @follow = Follow.create(follow_params)
            if @follow.save
       render json: {follow: @follow, followers: @user.followers, following: @user.follows}
     else
       render json: {error: "please try again, not really"}
     end
    end
  end

  # PATCH/PUT /follows/1 or /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: "Follow was successfully updated." }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1 or /follows/1.json
  def destroy
    message=""
        if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id )
    @follow = Follow.find_by(user_id: @user.id, following_id: params[:following_id])
    @follow.destroy
    message= "success"
        end
        render json:{message: message}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.permit(:user_id, :following_id)
    end
end
