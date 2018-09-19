class Tenant::Event < ApplicationRecord
  # belongs_to :tenant
  multi_tenant :tenant
end
