class Channel < ActiveRecord::Base
  has_many :show_listings
  has_many :shows, through: :show_listings

end
