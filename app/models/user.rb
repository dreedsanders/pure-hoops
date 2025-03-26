class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true, presence: true
    validates :password, presence: true
    has_one :team, dependent: :destroy
    has_many :posts
    has_many :replies
    has_many :likes
    has_many :follows
    has_many :followers
    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    has_many :sent_messages, foreign_key: :sender_id, class_name: 'Message'
    has_many :received_messages, foreign_key: :receiver_id, class_name: 'Message'

    has_one_attached :profile_picture


    def self.activity(user)
        users = []
        following_posts=[]
        following_likes = []
        following_replies = []
        following = user.following
        following.each do |user| users.push(user) 
    end
    users.each do |user| following_posts.push(user.posts)
    end
    users.each do |user| user.likes.each do |like| following_likes.push(user.likes) end 
    end
    users.each do |user| following_replies.push(user.replies)
    end
     {following: following, following_posts: following_posts, following_likes: following_likes, following_replies: following_replies}
    end

    def self.notifications(user)
        # get user posts
        userposts = user.posts
        # create likes array
        unseen_user_posts_likes = []
        # add each posts likes to array if user has not seen
        userposts.each do |post|
            post.likes.each do |like|
                if like.is_seen === false || like.is_seen == nil
                unseen_user_posts_likes.push(like)
                end
            end
        end

        # create replies array
        unseen_user_post_replies = []
        # get all replies
        replies = Reply.all
        # add each posts replies to array if user has not seen
        userposts.each do |post|
            post.replies.each do |reply|
                if reply.is_seen === false || reply.is_seen == nil
                    postreplyobject = replies.find(reply.id)
                    unseen_user_post_replies.push(postreplyobject)
            end
        end
        end

        # create messages array
        unseen_user_messages = []
        # add each message to array if user has not seen
        user.received_messages.each do |message|
            if message.is_seen === false || message.is_seen == nil
                unseen_user_messages.push(message)
            end
        end
        {unseen_user_messages: unseen_user_messages, unseen_user_post_replies: unseen_user_post_replies, unseen_user_posts_likes: unseen_user_posts_likes.uniq()}

    end

end
