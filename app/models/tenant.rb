class Tenant < ApplicationRecord
  # join to table 'tenant_users' through 'tenant_memberships'
  has_many :memberships, class_name: "Tenant::Membership", foreign_key: "tenant_id", dependent: :destroy
  has_many :users, through: :memberships
  has_many :events, dependent: :destroy
end
