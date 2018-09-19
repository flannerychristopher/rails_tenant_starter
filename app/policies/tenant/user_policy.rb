class Tenant::UserPolicy < ApplicationPolicy
  attr_reader :user, :tenant

  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
end
