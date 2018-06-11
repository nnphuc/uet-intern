class Thuctap < ApplicationRecord
    belongs_to :partner_info
    paginates_per 5
end
