class Transfer::OutcomesController < ApplicationController
  before_action :set_outcome, only: [:show,:edit,:destroy,:update]
  include TransferCommon
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
    common_update(@outcome,outcome_params)
  end

  def destroy
    common_destroy(@outcome)
    redirect_to transfer_outcomes_path, notice: 'Outcome was successfully destroyed.'
  end

  def create
    @outcome = Outcome.new(outcome_params)
    common_create(@outcome)
  end

  private
    def set_outcome
      @outcome = Outcome.find(params[:id])
    end

    def outcome_params
      params.require(:outcome).permit(:account_id,:amount,:description,:payee,:category_id,:transfer_date)
    end

end
