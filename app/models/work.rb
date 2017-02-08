class Work < ApplicationRecord
  has_many :reviews
  validates :name, :presence => true
  validates :description, :presence => true
  validates :artist, :presence => true
  validates :author, :presence => true
  validates :image, :presence => true
end
