class ChannelsController < ApplicationController

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new

  end

  def create
    @channel = Channel.new(channel_params)
    @channel.save
    flash[:notice] = "#{@channel.name} Successfully Added"
    redirect_to root_path
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
