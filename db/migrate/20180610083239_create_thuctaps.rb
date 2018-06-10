class CreateThuctaps < ActiveRecord::Migration[5.1]
  def change
    create_table :thuctaps do |t|
      t.integer :partner_id
      t.string :title
      t.string :content
      t.string :address
      t.string :tag
      t.datetime :endtime

      t.timestamps
    end
  end
end
