class Picture < ApplicationRecord
  def self.created_before(time)
    Picture.where("Created_at > ?", time)
  end

  def self.created_created_in_year(time)
    Picture.where("Created_at < ?", time)
  end
end
