class Transfer::IncomesController < ApplicationController
  before_action :set_income, only: [:show,:edit,:destroy,:update]
  include TransferCommon
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
    common_update(@income,income_params)
  end

  def destroy
    common_destroy(@income)
    redirect_to transfer_incomes_path, notice: 'Income was successfully destroyed.'
  end

  def create
    common_create(Income.new(income_params))
  end

  private
    def set_income
      @income = Income.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:account_id,:amount,:description,:payee,:category_id,:transfer_date)
    end

end
