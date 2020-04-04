class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all.order(name: :asc)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    s_str = 'transactions.name, transactions.id, transactions.amount, transactions.user_id'

    s_str2 = ', transactions.created_at, groups.icon , groups.name as gname, users.name as uname'

    @group_transactions = Transaction.where(group_id: params[:id]).joins(:group).joins(:user).select(s_str + s_str2)

    @group_transactions = @group_transactions.order(created_at: :desc)

    @group_transaction_sum = @group_transactions.sum(:amount)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to '/groups', notice: 'Group was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to '/groups', notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
