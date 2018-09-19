# join table 'tenant_users' and 'tenants'
class Tenant::Membership < ApplicationRecord
  belongs_to :user,   class_name: "Tenant::User", foreign_key: :tenant_user_id
  belongs_to :tenant, class_name: "Tenant"
end
