class Msg < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"  
    has_attached_file :document
    validates_attachment_content_type :document, content_type: /.*/
end
