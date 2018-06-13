class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :student_fixed_info
  has_one :student_info
  has_one :lecturer_info
  has_one :partner_info
  has_many :send_notifications, foreign_key: :sender_id, class_name: Notification.name, dependent: :delete_all
  has_many :receive_notifications, foreign_key: :receiver_id, class_name: Notification.name, dependent: :delete_all


  has_many :active_relationships,  class_name:  "Follow",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Follow",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :email, presence: true
  validates :password,presence: true


  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
