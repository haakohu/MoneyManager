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

  def self.get_all_transfers(account)
    Income.all.find_all{|t| t.account.id == account.id}
  end

  def self.create_new(account)
    t = Income.new
    t.account = account
    t.transfer_date = Date.today
    t
  end
end
