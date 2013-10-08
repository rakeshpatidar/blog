class AddUsernameToMember < ActiveRecord::Migration
  def change
    add_column :members, :username, :string
  end
end
