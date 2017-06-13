class Picture < ApplicationRecord
  def self.created_before(time)
    Picture.where("Created_at < ?", time)
  end
end
