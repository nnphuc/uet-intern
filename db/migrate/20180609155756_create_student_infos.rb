class CreateStudentInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :student_infos do |t|
      t.string :emailcanhan
      t.string :skypeid
      t.string :facebook
      t.string :dienthoai
      t.string :vitricanbo
      t.string :ngoaingu
      t.string :chungchi
      t.string :kinhnghiem
      t.string :mongmuon
      t.string :ghichu
      t.integer :user_id

      t.timestamps
    end
  end
end
