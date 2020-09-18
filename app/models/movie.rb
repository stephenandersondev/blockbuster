class Movie < ActiveRecord::Base
  has_many :rentals
  has_many :customers, through: :rentals

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find { |instance| instance.slug == slug }
  end
end
