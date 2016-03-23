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
    t = Transaction.get_all_transfers(self) + Outcome.all.find_all{|t|t.account_id == self.id} + Income.all.find_all{|t| t.account_id == self.id}
    t = t.find_all{|t| t.transfer_date <= Date.today}.sort{|a,b| a.transfer_date <=> b.transfer_date}.reverse
    t
  end

  def get_all_transfers
    t = Transaction.get_all_transfers(self) + Outcome.all.get_all_transfers(self) + Income.all.get_all_transfers(self)
    t.sort{|a,b| a.transfer_date <=> b.transfer_date}.reverse
  end


  def get_outcome_last_period(from)
    Outcome.get_all_transfers(self).find_all{|t| t.transfer_date >= from and t.transfer_date <= Date.today}.map{|t| t.amount}.sum
  end

  def get_income_last_period(from)
    Income.get_all_transfers(self).find_all{|t| t.transfer_date >= from and t.transfer_date <= Date.today}.map{|t| t.amount}.sum
  end

  def get_transaction_difference_last_period(from)
    Transaction.get_all_transfers(self).find_all{|t| t.transfer_date >= from}.map{|t| t.from == self ? -t.amount : t.amount}.sum
  end

  def get_worst_outcome_category(from) #From a date to now
    outcomes = Outcome.get_all_transfers_restricted(self,1.month.ago, Date.today)
    categories_outcome = Hash.new
    outcomes.each{|t| categories_outcome[t.category_id] == nil ? categories_outcome[t.category_id] = t.amount : categories_outcome[t.category_id]+= t.amount}
    Category.all.map{|t| [t,categories_outcome[t.id] == nil ? 0 : categories_outcome[t.id]]}.sort{|a,b| a[1] < b[1] ? 1 :-1}[0,4]
  end

  def get_best_income_category(from)
    incomes = Income.get_all_transfers_restricted(self,1.month.ago,Date.today)
    categories_income = Hash.new
    incomes.each{|t| categories_income[t.category_id] == nil ? categories_income[t.category_id] = t.amount : categories_income[t.category_id]+= t.amount}
    Category.all.map{|t| [t,categories_income[t.id] == nil ? 0 : categories_income[t.id]]}.sort{|a,b| a[1] < b[1] ? 1 :-1}[0,4]
  end
end
