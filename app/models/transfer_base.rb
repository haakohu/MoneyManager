class TransferBase < ApplicationRecord
  self.abstract_class = true
  belongs_to :user
  validates :amount       ,presence: true
  validates :transfer_date, presence: true

  def set_processed(value)
    self.processed = value
    self.save
  end

  def add_transfer
    self.set_processed(false)
    self.delay(run_at: self.transfer_date).do_transfer(self.amount,self.transfer_date)
  end

  def do_transfer(amount,transfer_date)
    if self.amount == amount && self.transfer_date.to_s == transfer_date.to_s
      if self.processed
        raise 'Wrong. Its already processed!'
      end
      self.set_processed(true)
      self.abstract_do_transfer
    end
  end

  def abstract_do_transfer
    raise 'Error! Abstract method!'
  end

  def revert_transaction
    if processed
      abstract_revert_transaction
    end
  end

  def abstract_revert_transaction
    raise 'Error! Abstract method!'
  end
end
