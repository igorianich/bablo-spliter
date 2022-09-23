class CreateUsersGroupsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :groups, :users
    add_index :groups_users, [:group_id, :user_id], unique: true, name: 'index_groups_users'
  end
end
