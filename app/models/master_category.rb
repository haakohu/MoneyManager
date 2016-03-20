class MasterCategory < ApplicationRecord
  belongs_to :user

  validates :name, presence: true


  def self.get_master_categories(user)
    MasterCategory.all.find_all{|t| t.user == nil or t.user == user}
  end
end
