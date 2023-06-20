class Category < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  def name
    category_name
  end
  
  validates :category_name, presence: true, uniqueness: true
end
