class Picture < ApplicationRecord

  validates :artist, :url, presence: true
  validates :title, length: {in: 3..20}
  validates :url, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  # scope :month_old_pictures, -> {created_before(1.month.ago) }
  # scope :created_in_year_2017, -> {created_in_year(Date.new(2017)) }
  # scope :created_in_year_2016, -> {created_in_year(Date.new(2016)) }
  # scope :created_in_year_2015, -> {created_in_year(Date.new(2015)) }

end
