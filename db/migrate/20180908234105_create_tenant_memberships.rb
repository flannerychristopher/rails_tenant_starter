class CreateTenantMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_memberships do |t|
      t.references :tenant_user, foreign_key: true
      t.references :tenant, foreign_key: true
    end
  end
end
