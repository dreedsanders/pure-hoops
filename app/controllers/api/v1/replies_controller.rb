class Api::V1::RepliesController < ApplicationController
  # before_action :set_reply, only: %i[ show edit update destroy ]

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
    render json: {replies: @replies}
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies or /replies.json
  def create
    message = ""
    if decode_token
      @reply = Reply.create(reply_params)
      message="success"
    end
    render json: {reply: @reply, message: message}

  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end
  def updateSeen
    @reply = Reply.find(params[:reply_id])
    @reply.update!(reply_params)
        
  render json: {reply: @reply}
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to replies_path, status: :see_other, notice: "Reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.permit(:post_id, :user_id, :body, :is_seen)
    end
end
