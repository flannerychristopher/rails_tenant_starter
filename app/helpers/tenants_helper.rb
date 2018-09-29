module TenantsHelper

  def current_tenant_user
    current_tenant_user ||= super || Tenant::Guest.new
  end
  
end
