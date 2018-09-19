class Tenant::UsersRole < ApplicationRecord
  self.primary_key = :user_id
  multi_tenant :tenant
  belongs_to :tenant, class_name: "Tenant"
  belongs_to :user,   class_name: "Tenant::User"
  belongs_to :role,   class_name: "Role"
end
