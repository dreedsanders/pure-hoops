class Api::V1::AuthController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def log_in
        @user = User.find_by(email: login_params[:email])
        if @user.profile_picture.attached? 
        user_team = Team.find_by(user_id: @user.id)
        @players = []
        followingIds = []
        @likedpostids = []
        @likedposts = []

        
        likes = Like.all
        likes.each do |like|
            if like.user_id == @user.id
                @likedposts.push(like)
            end
        end

        @likedposts.each do |post|
            @likedpostids.push(post.post_id)
        end
    

        @user.follows.each do |following|
            followingIds.push(following.following_id)
        end
        if user_team && user_team.players.length >= 1
            @players = user_team.players
        else
            @players = []
        end
        if @user.authenticate(login_params[:password])
            token = encode_token(user_id: @user.id)
            render json: {user: @user, token: token, user_team: user_team, team_players: @players, message: "success", following: followingIds.uniq(), followed: @user.following, followers: @user.followers, likedposts: @likedposts, likedpostids: @likedpostids.uniq(), userposts: @user.posts, sent_messages: @user.sent_messages, received_messages: @user.received_messages, profile_picture: url_for(@user.profile_picture)}
            else
            render json: {message: 'Incorrect password'}, status: :unauthorized
        end
    else
          user_team = Team.find_by(user_id: @user.id)
        @players = []
        followingIds = []
        @likedpostids = []
        @likedposts = []

        
        likes = Like.all
        likes.each do |like|
            if like.user_id == @user.id
                @likedposts.push(like)
            end
        end

        @likedposts.each do |post|
            @likedpostids.push(post.post_id)
        end
    

        @user.follows.each do |following|
            followingIds.push(following.following_id)
        end
        if user_team && user_team.players.length >= 1
            @players = user_team.players
        else
            @players = []
        end
        if @user.authenticate(login_params[:password])
            token = encode_token(user_id: @user.id)
            render json: {user: @user, token: token, user_team: user_team, team_players: @players, message: "success", following: followingIds.uniq(), followed: @user.following, followers: @user.followers, likedposts: @likedposts, likedpostids: @likedpostids.uniq(), userposts: @user.posts, sent_messages: @user.sent_messages, received_messages: @user.received_messages}
            else
            render json: {message: 'Incorrect password'}, status: :unauthorized
        end
    end

    end

        private 

    def login_params 
        params.permit(:email, :password)
    end

    def handle_record_not_found(e)
        render json: { message: "User doesn't exist" }, status: :unauthorized
    end

end
