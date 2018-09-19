class AddTenantIdToTenantUsersRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :tenant_users_roles, :tenant_id, :bigint
  end
end
