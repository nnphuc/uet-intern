class CreateMsgs < ActiveRecord::Migration[5.1]
  def change
    create_table :msgs do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :title
      t.string :content
      t.attachment :document

      t.timestamps
    end
  

  end
end
