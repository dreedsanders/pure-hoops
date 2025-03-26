class Api::V1::UsersController < ApplicationController
    # wrap_parameters :user, include: [ :name, :email, :password, :photo]
    # rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
     wrap_parameters false

 
   def index
       @users=User.all
       @usersinfo = []
       users = @users.map do |user|
        if user.profile_picture.attached?
          @usersinfo.push({id: user.id, name: user.name, email: user.email, bank: user.bank, photo: user.photo, likes: user.likes, bio: user.bio, goat: user.goat, profile_picture: url_for(user.profile_picture)})
        else
          @usersinfo.push({id: user.id, name: user.name, email: user.email, bank: user.bank, photo: user.photo, likes: user.likes, bio: user.bio, goat: user.goat})
        end

        
       end
       render json: {users: @usersinfo}
   end
  
   def show
    message = "show"
       @user=User.find_by(id: params[:user_id])
       render json: {user: @user, message: message, params: params}
   end

   def recentlyOnline
    # write something that looks at recent games, posts, follows
    # choose the top two most recent users who created each of those
    # return those users in an array
    recentUserIds = []
    recentUsers = []
    posts = Post.all
    recentPosts = posts.reverse()[0...3]
    follows = Follow.all
    recentFollows  = follows.reverse()[0...3]
    recentPosts.each do |post|
      recentUserIds.push(post.user_id)
    end
    recentFollows.each do |follow|
      recentUserIds.push(follow.user_id)
    end
    recentUserIds.each do |id|
      user = User.find_by(id: id)
      recentUsers.push(user)
    end

    render json: {recentUsers: recentUsers.uniq()}
   end
 
 
   def create
     @user = User.create!(user_params)
     token = encode_token(user_id: @user.id)
      if @user.save
       render json: {user: @user, token:token, id: @user.id }
     else
       render json: {error: "Email taken, please choose another email"}
     end
   end

   def update
    if decode_token
    user_id = decode_token[0]['user_id']
    @user=User.find_by(id: user_id)
    @user.update(user_params)
    end
    render json: {user: @user}
  end

  def updateProfilePicture
    if decode_token
    user_id = decode_token[0]['user_id']
    @user=User.find_by(id: user_id)
    @user.update(user_params)
    end
    render json: {picture: url_for(@user.profile_picture), user: @user}
  end

    def destroy
       if decode_token
      user_id = decode_token[0]['user_id']
      user = User.find_by(id: user_id )
      user.destroy
      render json: {message: "success"}
       end
    end
  
    def current_user
      if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
        render json: {user: @user}
    end

    def activity
            if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by(id: user_id)
            @activity = User.activity(@user)
        end
        render json:{activity: @activity}
    end

  def my_teams
    # need a catch to send back a message if no team is found for a user
    
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
      user_team=@user.team
      team_players = user_team.players
    end
    render json: {team: @user.team, players: team_players}
  end

  def notifications
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
      @notifications = User.notifications(@user)
    end
    render json: {notifications: @notifications}
  end



 
   private
 
   def user_params
       params.permit(:id, :name, :password, :photo, :email, :profile_picture, :bio, :goat)
   end
   def handle_invalid_record(e)
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
