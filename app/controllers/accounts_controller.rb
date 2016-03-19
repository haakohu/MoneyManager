class AccountsController < ApplicationController
  before_action :set_account, only: [:show]
  def index
    @accounts = Account.all.find_all{|t| t.user == current_user}
  end

  def new
    @account = Account.new
  end


  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      redirect_to account_path(@account), notice: 'Account was sucessfully created'
    else
      render :new
    end
  end

  def show
  end

  private
    def account_params
      params.require(:account).permit(:name,:balance)
    end

    def set_account
      @account = Account.find(params[:id])
    end

end
