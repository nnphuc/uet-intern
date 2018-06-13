class Message < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :conversation, required: false
  validates :content, presence: true

  scope :for_display, -> { order(:created_at).last(50)}

  def is_message? current_user
    return self.user == current_user
  end
end
