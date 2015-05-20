class Show < ActiveRecord::Base
  has_many :show_listings
  has_many :channels, through: :show_listings
end
