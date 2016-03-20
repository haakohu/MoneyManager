class Category < ApplicationRecord
  belongs_to :user
  belongs_to :master_category
  validates :name, presence: true
end
