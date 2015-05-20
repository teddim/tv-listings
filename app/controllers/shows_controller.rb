class ShowsController<ApplicationController

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    @show.save
    flash[:notice] = "#{@show.name} Successfully Added"
    redirect_to show_path(@show)
  end

  def show
    @show = Show.find(params[:id])
    @show_listings = @show.show_listings
  end

  def edit
    @show = Show.find(params[:id])

  end

  def update
    @show = Show.find(params[:id])
    @show.update(show_params)
    flash[:notice] = "#{@show.name} Successfully Updated"
    redirect_to show_path(@show)
  end

  private

  def show_params
    params.require(:show).permit(:name)

  end
end
