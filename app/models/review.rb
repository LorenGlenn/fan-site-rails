class Review < ApplicationRecord
  belongs_to :work

  validates :name, :presence => true
  validates :rating, :presence => true
  validates :details, :presence => true

  # after_save :calculate_rating
  #
  # def calculate_rating
  #   work = self.work
  #   temp = work.reviews.length - 1
  #   total = work.avgrating * temp
  #   total = total+ self.rating
  #   work.avgrating = total / work.reviews.length
  # end
end
