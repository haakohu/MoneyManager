class Transaction < ApplicationRecord
  belongs_to :from, class_name:'Account'
  belongs_to :to, class_name:'Account'
  belongs_to :user
  validates :amount, presence:true
  validates :transfer_date, presence:true

  def add_transfer
    self.set_processed(false)
    self.delay(run_at: self.transfer_date).do_transfer(self.amount,self.transfer_date)
  end

  def set_processed(value)
    self.processed = value
    self.save
  end

  def do_transfer(amount,transfer_date)
    if self.amount == amount && self.transfer_date.to_s == transfer_date
      if self.processed
        a = Account.new
        a.name = 'FEIL FEIL FEIL.' + self.id.to_s + self.transfer_date.to_s + self.amount.to_s
        a.save
      end
      self.set_processed(true)
      self.to.deposit(amount)
      self.from.withdraw(amount)
    end
  end


  def revert_transaction
    if processed
      self.from.deposit(amount)
      self.to.withdraw(amount)
    end
  end


end
