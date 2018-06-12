class CreateStudentFixedInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :student_fixed_infos do |t|
      t.integer :msv
      t.string :lop
      t.string :khoa
      t.string :nganh
      t.string :diachi
      t.string :hoten
      t.float :diemtb
      t.date :namtotnghiep

      t.timestamps
    end
  end
end
