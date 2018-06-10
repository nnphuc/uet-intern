class ChageNameThuctap < ActiveRecord::Migration[5.1]
  def change
    rename_column :thuctaps, :partner_id, :partner_info_id
  end
end
