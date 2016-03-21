class Transaction < TransferBase
  belongs_to :from, class_name:'Account'
  belongs_to :to, class_name:'Account'
  belongs_to :user
  def abstract_do_transfer
    self.to.deposit(self.amount)
    self.from.withdraw(self.amount)
  end

  def abstract_revert_transaction
    self.to.withdraw(self.amount)
    self.from.deposit(self.amount)
  end
end
