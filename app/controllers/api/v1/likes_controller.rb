class Api::V1::LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
    render json: {likes: @likes}
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create
    message = "negative"
        if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id )
      @like = Like.create(like_params)
      message="success"
    end
    render json: {message: message, like: @like}
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    if decode_token
    user_id = decode_token[0]['user_id']
    @user=User.find_by(id: user_id)
    @like = Like.find(params[:id])
    @like.update(like_params)
    end
    render json: {like: @like}

  end

    def updateSeen
    @like = Like.find(params[:like_id])
    @like.update!(like_params)
        
  render json: {like: @like}
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = Like.find_by(like_params)
    message = @like.destroy
    render json: {message: message}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.permit(:post_id, :user_id, :is_seen)
    end
end
