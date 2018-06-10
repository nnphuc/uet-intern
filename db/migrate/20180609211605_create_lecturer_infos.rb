class CreateLecturerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :lecturer_infos do |t|
      t.integer :user_id
      t.string :gmail
      t.string :dienthoai
      t.string :ghichu

      t.timestamps
    end
  end
end
