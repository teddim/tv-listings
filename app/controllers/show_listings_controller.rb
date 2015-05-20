class ShowListingsController < ApplicationController

  def new
    @show_listing = ShowListing.new
  end
  def create
    @show_listing = ShowListing.new(show_listing_params)
    @show = show_listing_params[:show_id]
    @show_listing.save
    flash[:notice] = "Show Listing Successfully Added"
    redirect_to show_path(@show)
  end

  private
  def show_listing_params
    params.require(:show_listing).permit(:date, :channel_id, :show_id)

  end
end
