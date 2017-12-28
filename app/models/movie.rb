class Movie < ActiveRecord::Base
  mount_uploader :poster, PhotoUploader

  has_many :reviews

  def number
    self.reviews.count
  end

  def average
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    if self.reviews.count == 0
      0
    else
      sum.to_f / self.reviews.count
    end
  end
end
