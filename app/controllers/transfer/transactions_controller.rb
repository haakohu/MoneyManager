class Transfer::TransactionsController < ApplicationController
  include TransferCommon
  before_action :set_transaction, only: [:show,:destroy,:edit,:update]
  def index
    @transactions =  Transaction.all.find_all{|t| t.user == current_user}
  end

  def new
    @transaction = Transaction.new
    @transaction.transfer_date = Date.today
  end

  def create
    common_create(Transaction.new(transaction_params))
  end

  def show
  end


  def edit
  end

  def update
    common_update(@transaction,transaction_params)
  end

  def destroy
    common_destroy(@transaction)
    redirect_to transfer_transactions_url, notice: "Transaction was successfully destroyed."
  end
  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
    def transaction_params
      params.require(:transaction).permit(:amount,:to_id,:from_id,:description,:transfer_date)
    end
end
