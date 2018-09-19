module Rollable

  def has_role?(role_symbol, tenant)
    role = Role.find_by(name: role_symbol)
    MultiTenant.with(tenant) do
      roles.where(role: role).present? ? true : false
    end
  end

  def add_role(role_symbol, tenant)
    role = Role.find_by(name: role_symbol)
    MultiTenant.with(tenant) do
      roles.new(role: role)
      save
    end
  end

  def remove_role(role_symbol, tenant)
    role = Role.find_by(name: role_symbol)
    MultiTenant.with(tenant) do
      role = roles.find_by(role: @role)
      role.destroy!
    end
  end

end