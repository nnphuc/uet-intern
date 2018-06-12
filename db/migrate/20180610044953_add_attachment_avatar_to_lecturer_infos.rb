class AddAttachmentAvatarToLecturerInfos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :lecturer_infos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :lecturer_infos, :avatar
  end
end
