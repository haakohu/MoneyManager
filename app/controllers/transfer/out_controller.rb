class Transfer::OutController < ApplicationController
  before_action :set_outcome, only: [:show,:edit,:destroy]

  def show
  end

  def new
    @outcome = Outcome.new
  end

  def edit
  end

  def update
    old_outcome = @outcome.dup
    if @outcome.update(outcome_params)
      old_outcome.revert_transaction
      @outcome.add_transfer
      redirect_to @outcome, notice: 'Outcome was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @outcome.revert_transaction
    @outcome.destroy
    redirect_to transfer_transactions_path, notice: 'Outcome was successfully destroyed.'
  end

  def create
    @outcome = Outcome.new(outcome_params)
    @outcome.user = current_user
    if @outcome.save
      @outcome.add_transfer
      redirect_to @outcome, notice: 'Outcome was successfully created.'
    end
  end

  private
    def set_outcome
      @outcome = Outcome.find(params[:id])
    end

    def outcome_params
      params.require(:outcome).permit(:account_id,:amount,:description,:payee,:category_id,:transfer_date)
    end

end
