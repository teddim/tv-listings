class ShowListing < ActiveRecord::Base
  belongs_to :channel
  belongs_to :show
end
