class AddNameToPartnerInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :partner_infos, :name, :string
  end
end
