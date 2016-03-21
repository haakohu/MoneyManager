class Transfer::IncomesController < ApplicationController
  before_action :set_income, only: [:show,:edit,:destroy,:update]

  def show
  end

  def new
    @income = Income.new
    @income.transfer_date = Date.today
  end

  def edit
  end

  def index
    @incomes = Income.all.find_all{|t| t.user == current_user}
  end

  def update
    old_income = @income.dup
    if @income.update(income_params)
      old_income.revert_transaction
      @income.add_transfer
      redirect_to [:transfer,@income], notice: 'Income was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @income.revert_transaction
    @income.destroy
    redirect_to transfer_incomes_path, notice: 'Income was successfully destroyed.'
  end

  def create

    @income = Income.new(income_params)
    @income.user = current_user
    if @income.save
      @income.add_transfer
      redirect_to transfer_income_path(@income), notice: 'Income was successfully created.'
    end
  end

  private
    def set_income
      @income = Income.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:account_id,:amount,:description,:payee,:category_id,:transfer_date)
    end

end
