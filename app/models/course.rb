class Course < ApplicationRecord
    has_and_belongs_to_many :users

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :audit, presence: true
  validates :price, presence: true, comparison: {greater_than: 0}
end
