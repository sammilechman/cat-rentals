class CatsController < ApplicationController

  def create
    c = Cat.create!(cat_params)
    redirect_to cat_url(c)
  end

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @requests = @cat.rental_requests
  end

  def new
    @cat = Cat.new()
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)
    redirect_to cat_url(@cat)
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :sex, :color, :birth_date)
  end

end
