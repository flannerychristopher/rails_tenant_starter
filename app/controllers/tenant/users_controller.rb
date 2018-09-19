class Tenant::UsersController < ApplicationController
  before_action :set_tenant_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  # GET /tenant/:tenant_id/users
  # GET /tenant/:tenant_id/users.json
  def index
    @tenant_users = current_tenant.users
  end

  # GET /tenant/users/1
  # GET /tenant/users/1.json
  def show
  end

  # GET /tenant/users/new
  def new
    @tenant_user = Tenant::User.new
  end

  # GET /tenant/users/1/edit
  def edit
  end

  # POST /tenant/users
  # POST /tenant/users.json
  def create
    @tenant_user = Tenant::User.new(tenant_user_params)

    respond_to do |format|
      if @tenant_user.save
        format.html { redirect_to @tenant_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_user }
      else
        format.html { render :new }
        format.json { render json: @tenant_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant/users/1
  # PATCH/PUT /tenant/users/1.json
  def update
    respond_to do |format|
      if @tenant_user.update(tenant_user_params)
        format.html { redirect_to @tenant_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_user }
      else
        format.html { render :edit }
        format.json { render json: @tenant_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant/users/1
  # DELETE /tenant/users/1.json
  def destroy
    @tenant_user.destroy
    respond_to do |format|
      format.html { redirect_to tenant_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_user
      @tenant_user = Tenant::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_user_params
      params.fetch(:tenant_user, {})
    end
end
