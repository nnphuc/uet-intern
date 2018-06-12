class AddMoreinfoToLecturerInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :lecturer_infos, :hoten, :string
    add_column :lecturer_infos, :khoa, :string
    add_column :lecturer_infos, :diachi, :string
  end
end
