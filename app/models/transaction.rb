class Transaction < TransferBase
  include ActiveModel::Validations

  belongs_to :from, class_name:'Account'
  belongs_to :to, class_name:'Account'
  belongs_to :user
  validates_with TransactionValidator

  def abstract_do_transfer
    self.to.deposit(self.amount)
    self.from.withdraw(self.amount)
  end

  def abstract_revert_transaction
    self.to.withdraw(self.amount)
    self.from.deposit(self.amount)
  end

  def self.get_all_transfers(account)
    Transaction.all.find_all{|t| t.to.id == account.id || t.from.id == account.id}
  end


  def self.create_new(account)
    t = Transaction.new
    t.from = account
    t.transfer_date = Date.today
    t
  end
end
