class AddIndextoUserId < ActiveRecord::Migration
  def change
    add_index :cats, :user_id
  end
end
