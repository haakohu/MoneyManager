class Outcome < TransferBase
  belongs_to :account
  belongs_to :category
  belongs_to :user
  validates :account      , presence: true
  validates :category     , presence: true

  def abstract_do_transfer
    self.account.withdraw(self.amount)
  end

  def abstract_revert_transaction
    self.account.deposit(self.amount)
  end

  
end
