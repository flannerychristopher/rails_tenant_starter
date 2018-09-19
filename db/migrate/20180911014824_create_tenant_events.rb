class CreateTenantEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_events do |t|
      t.string :name
      t.references :tenant, foreign_key: true

      t.timestamps
    end
  end
end
