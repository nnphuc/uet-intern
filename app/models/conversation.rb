class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name

  def sender? user_id
    return true if sender.id == user_id
    false
  end

  def receiver? user_id
    return true if receiver.id = user_id
    false
  end
end
