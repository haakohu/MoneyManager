class Account < ApplicationRecord

  validates :name, presence: true
  validates :balance, presence: true
  belongs_to :user


  def withdraw(amount)
    self.balance -= amount
    self.save
  end

  def deposit(amount)
    self.balance += amount
    self.save
  end

  def get_recent_transfer(size)
    t = Transaction.all.find_all{|t|t.from.id == self.id or t.to.id == self.id} + Outcome.all.find_all{|t|t.account_id == self.id} + Income.all.find_all{|t| t.account_id == self.id}
    t = t.find_all{|t| t.transfer_date <= Date.today}.sort{|a,b| a.transfer_date <=> b.transfer_date}.reverse
    t
  end


end
