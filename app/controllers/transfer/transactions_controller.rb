class Transfer::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show,:destroy,:edit,:update]
  def index
    @transactions =  Transaction.all.find_all{|t| t.user == current_user}
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.add_transfer
    if @transaction.description == nil || @transaction.description == ""
      @transaction.description = "Transaction on: " + @transaction.transfer_date.to_s
    end
    if @transaction.save
      redirect_to [:transfer,@transaction], notice: 'Transaction was sucessfully created'
    else
      render :new
    end
  end
  def show
  end


  def edit
  end

  def update
    old_transaction = @transaction.dup
    if @transaction.update(transaction_params)
      old_transaction.revert_transaction
      @transaction.add_transfer
      redirect_to [:transfer, @transaction], notice: 'Tra nsaction was successfully updated.'
    else
      render :edit
  end

  end
  def destroy
    @transaction.revert_transaction
    @transaction.destroy
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
