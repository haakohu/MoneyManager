class Income < TransferBase
  belongs_to :account
  belongs_to :category
  validates :category     , presence: true
  validates :account      , presence: true

  def abstract_do_transfer
    self.account.deposit(self.amount)
  end

  def abstract_revert_transaction
    self.account.withdraw(self.amount)
  end
end
