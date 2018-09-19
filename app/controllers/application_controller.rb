class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  set_current_tenant_through_filter
  before_action :set_tenant_as_current_tenant

  # before_action :authenticate_user!

  # wrap devise to guarantee a current_user_object
  # alias_method :devise_current_user, :current_user
  # def current_user
  #   return devise_current_admin_user if devise_current_admin_user
  #   return devise_current_tenant_user if devise_current_tenant_user
  #   return Tenant::Guest.new
  # end

  private
    
    def set_tenant_as_current_tenant
      id = if params[:controller] == 'tenants'
        params[:id]
      elsif params[:tenant_id]
        params[:tenant_id]
      else
        params[:current_tenant_id]
      end
      if id
        tenant = Tenant.find(id)
        set_current_tenant(tenant)
      end
    end

    def authorize_admin
      puts "authorizing admin"
      unless current_user.has_role?(:admin, current_tenant)
        flash[:notice] = "Not authorized."
        redirect_to root_url
      end
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

end
