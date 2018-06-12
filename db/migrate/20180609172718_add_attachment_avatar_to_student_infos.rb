class AddAttachmentAvatarToStudentInfos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :student_infos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :student_infos, :avatar
  end
end
