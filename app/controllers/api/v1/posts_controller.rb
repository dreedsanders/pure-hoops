class Api::V1::PostsController < ApplicationController
  # before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @postsandreplies = []
    posts = @posts.map do |post|
      @postsandreplies.push({body: post.body, created_at: post.created_at, updated_at: post.updated_at, user_id: post.user_id, user_name: User.find_by(id: post.user_id), category: post.category, subcategory: post.subcategory, replies: post.replies, id: post.id, likes: post.likes})
    end
   categories =  Post.distinct.pluck(:category)
   subcategories =  Post.distinct.pluck(:category, :subcategory)
    render json: {posts: @postsandreplies, categories: categories, subcategories: subcategories}
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
      @post = Post.create!(post_params)
      message =  {post: @post}
    else
      message = {message: "nope"}
    end
    render json: {message: message}
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def delete
    @post = Post.find(params[:id])
    message = @post.destroy
    render json: {message: message}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:body, :user_id, :category, :subcategory)
    end
end
