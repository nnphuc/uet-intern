class AddAttachmentLogoToPartnerInfos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :partner_infos do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :partner_infos, :logo
  end
end
