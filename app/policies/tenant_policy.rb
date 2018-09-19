class TenantPolicy < ApplicationPolicy
  attr_reader :user, :tenant
  
  class Scope < Scope
    attr_reader :user, :tenant
    def resolve
      # if user.has_role?(:admin, tenant)
        scope.all
      # else
      #   user.tenants
      # end
    end
  end
  
  def initialize(user, tenant)
    @user = user
    @tenant = tenant
  end
  
  def show?
    user.tenants.include? tenant
    # tenant.users.include? user
  end

  def new?
    user.has_role? :admin, tenant
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

end
