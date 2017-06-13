class Picture < ApplicationRecord
  def self.created_before(time)
    Picture.where("Created_at < ?", time)
  end

  def self.created_in_year(time)
    Picture.where("Created_at < ?", time)
  end

  scope :month_old_pictures, -> {created_before(1.month.ago) }
  scope :created_in_year_2017, -> {created_in_year(Date.new(2017)) }
  scope :created_in_year_2016, -> {created_in_year(Date.new(2016)) }
  scope :created_in_year_2015, -> {created_in_year(Date.new(2015)) }

end
