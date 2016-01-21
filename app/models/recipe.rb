class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :need_ingredients, presence: true
  validates :steps, presence: true
end
