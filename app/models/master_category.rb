class MasterCategory < ApplicationRecord
  belongs_to :user

  validates :name, presence: true


  def self.get_master_categories(user)
    MasterCategory.all.find_all{|t| t.user == nil or t.user == user}
  end

  def self.get_list_with_master_and_subcat()
    MasterCategory.all.find_all{|t|t.name != 'Income'}.map{|t| t.name}.map{|t| [t, Category.all.find_all{|f| f.master_category.name == t}.map{|f| [f.name,f.id]}]}
  end

  def self.get_list_with_subcat(transaction)
    if(transaction.class == Income)
      MasterCategory.all.find_all{|t| t.name == "Income"}.map{|t| [t.name,Category.all.find_all{|f| f.master_category.name == t.name}.map{|f| [f.name,f.id]}]}
    else
      MasterCategory.all.find_all{|t|t.name != 'Income'}.map{|t| t.name}.map{|t| [t, Category.all.find_all{|f| f.master_category.name == t}.map{|f| [f.name,f.id]}]}

    end

  end

end
