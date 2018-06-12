class AddUserIdToStudentFixedInfo < ActiveRecord::Migration[5.1]
  
  def change
    add_column :student_fixed_infos, :user_id, :integer
  end
end
