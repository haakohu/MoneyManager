class Category < ApplicationRecord
  belongs_to :user
  belongs_to :master_category
  validates :name, presence: true

  def self.get_categories(user)
    Category.all.find_all{|t| t.user == nil or t.user == user}
  end
end
