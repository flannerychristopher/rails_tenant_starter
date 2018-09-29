class CreateTenantUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_user_roles do |t|
      t.bigint :tenant_id
      t.bigint :user_id
      t.string :name
    end
  end
end
