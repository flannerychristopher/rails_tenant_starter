class Tenant::Guest < ApplicationRecord
  
  def email
    "no email for guest user"
  end

  def has_role?(role_symbol, tenant)
    false
  end

  def admin?
    false
  end

  def tenants
    []
  end
end
