class Transfer::OutcomesController < ApplicationController
  before_action :set_outcome, only: [:show,:edit,:destroy,:update]

  def show
  end

  def new
    @outcome = Outcome.new
    @outcome.transfer_date = Date.today
  end

  def edit
  end

  def index
    @outcomes = Outcome.all.find_all{|t| t.user == current_user}
  end

  def update
    old_outcome = @outcome.dup
    if @outcome.update(outcome_params)
      old_outcome.revert_transaction
      @outcome.add_transfer
      redirect_to [:transfer,@outcome], notice: 'Outcome was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @outcome.revert_transaction
    @outcome.destroy
    redirect_to transfer_outcomes_path, notice: 'Outcome was successfully destroyed.'
  end

  def create

    @outcome = Outcome.new(outcome_params)
    @outcome.user = current_user
    if @outcome.save
      @outcome.add_transfer
      redirect_to transfer_outcome_path(@outcome), notice: 'Outcome was successfully created.'
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
