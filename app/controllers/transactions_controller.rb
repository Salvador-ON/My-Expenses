class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  

  # GET /transactions
  # GET /transactions.json
  def index
    @user_transactions = Transaction.where(user_id: current_user.id).joins(:group).joins(:user).select('transactions.name, transactions.id, transactions.amount, transactions.user_id, transactions.created_at, groups.icon , groups.name as gname, users.name as uname').order(created_at: :desc)

    @transaction_sum = @user_transactions.sum(:amount)
    
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id 

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to '/transactions', notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to '/transactions', notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def etransaction
    @ext_user_transaction = Transaction.where(user_id: current_user.id, group_id: nil).joins(:user).select('transactions.name, transactions.id, transactions.amount, transactions.user_id, transactions.created_at, users.name as uname').order(created_at: :desc)

    @ext_transaction_sum = @ext_user_transaction.sum(:amount)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name, :amount, :group_id)
    end
end
