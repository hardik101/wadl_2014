class RemoveActiveAdmin < ActiveRecord::Migration
  def change 

  	drop_table :active_admin_comments
  	drop_table :admin_users
  	drop_table :member_infos


  end 

end