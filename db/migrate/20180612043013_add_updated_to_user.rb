class AddUpdatedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :updated, :boolean,default: false
  end
end
