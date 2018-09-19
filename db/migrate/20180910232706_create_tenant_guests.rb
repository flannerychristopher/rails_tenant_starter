class CreateTenantGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_guests do |t|

      t.timestamps
    end
  end
end
