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
  has_many :receive_notifications, foreign_key: receiver_id:, class_name: Notification.name, dependent: :delete_all

end
