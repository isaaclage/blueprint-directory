class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])
  end
  
  def index
    @category = :design
    @resources = Resource.where("category <> ?", Resource.categories[@category])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.category = 0
    if @resource.save
      redirect_to @resource
    else
      render 'new'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :email, :position, :location, :company, :website)
  end
  
end
