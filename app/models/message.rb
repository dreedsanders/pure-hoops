class Message < ApplicationRecord
    belongs_to :messager, foreign_key: 'sender_id', class_name: 'User'
    belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
    belongs_to :user, foreign_key: 'sender_id', class_name: 'User'
end
