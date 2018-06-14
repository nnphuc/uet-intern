json.extract! msg, :id, :sender_id, :receiver_id, :title, :content, :created_at, :updated_at
json.url msg_url(msg, format: :json)
