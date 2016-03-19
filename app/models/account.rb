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


end
