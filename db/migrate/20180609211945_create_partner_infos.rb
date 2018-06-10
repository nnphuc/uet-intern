class CreatePartnerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :partner_infos do |t|
      t.integer :user_id
      t.string :contact
      t.string :address
      t.string :dienthoai

      t.timestamps
    end
  end
end
