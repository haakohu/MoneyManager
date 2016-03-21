class TransferBaseController < ApplicationController

  def create(transfer)
    transfer.user = current_user
    transfer.add_transfer
    if transfer.description == nil || transfer.description == ""
      transfer.description = "Transaction on: " + transfer.transfer_date.to_s
    end
    if transfer.save
      redirect_to [:transfer, transfer], notice: 'Transfer was successfully created.'
    else
      render :new
    end
  end
end
