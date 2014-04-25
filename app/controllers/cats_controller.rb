class CatsController < ApplicationController

  before_action :require_cat_owner!, only: [:edit, :update ]
  helper_method :current_owner?

  def create
    c = Cat.create!(cat_params)
    c.user_id = current_user.id
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
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)
    redirect_to cat_url(@cat)
  end

  def current_cat
    Cat.find(params[:id])
  end

  def current_owner?
    current_user.try(:id) == current_cat.user_id
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :sex, :color, :birth_date)
  end

  def require_cat_owner!
    if current_user.try(:id) != current_cat.user_id
      flash[:notice] = "Sorry, you are not authorized to do that action."
      redirect_to root_url
    end
  end

end
