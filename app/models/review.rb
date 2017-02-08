class Review < ApplicationRecord
  belongs_to :work

  validates :name, :presence => true
  validates :rating, :presence => true
  validates :details, :presence => true
end
