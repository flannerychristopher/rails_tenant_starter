class Tenant::User < ApplicationRecord

  include ::Rollable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # join to table 'tenants' through 'tenant_memberships'
  has_many :memberships, class_name: "Tenant::Membership", foreign_key: "tenant_user_id", dependent: :destroy
  has_many :tenants, through: :memberships

  has_many :roles, class_name: "Tenant::UsersRole", foreign_key: "user_id", dependent: :destroy

  def is_a_guest?
    self.class == Tenant::Guest
  end
end
