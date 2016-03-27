module TransferCommon
  extend ActiveSupport::Concern


  def common_create(transfer)
    transfer.user = current_user
    if transfer.description == nil || transfer.description == ""
      transfer.description = "Transaction on: " + transfer.transfer_date.to_s
    end
    if transfer.save
      transfer.add_transfer
      if(transfer.class == Transaction)
        redirect_to :back, notice: 'Transfer was successfully created.'
      else
        redirect_to :back, notice: 'Transfer was successfully created.'
      end
    else
      render :new
    end
  end

  def common_destroy(transfer)
    transfer.revert_transaction
    transfer.destroy
  end

  def common_update(transfer,transaction_params)
    old_transaction = transfer.dup
    if transfer.update(transaction_params)
      old_transaction.revert_transaction
      transfer.add_transfer
      redirect_to [:transfer, transfer], notice: 'Transfer was successfully updated.'
    else
      render :edit
    end
  end

end
