class Nom < ActiveRecord::Base
  attr_accessible :description, :ingredients, :name, :steps, :category, :user_id
  
  CATEGORY = ['Dinner', 'Lunch', 'Breakfast', 'Snack', 'Drink', 'Alcohol']
  
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 140 }
  validates :category, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :ingredients, presence: true
  validates :steps, presence: true
  validates :user_id, presence: true
  
  default_scope order: 'created_at DESC'
end
