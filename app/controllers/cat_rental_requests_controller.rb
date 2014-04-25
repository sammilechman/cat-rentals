class CatRentalRequestsController < ApplicationController

  before_action :require_current_user!, only: [:create, :new]
  before_action :require_cat_owner!, only: [:approve, :deny]

  def new
    @cats = Cat.all
  end

  def create

    @rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      flash[:errors] = @rental_request.errors.full_messages
      @cats = Cat.all
      render :new
    end
  end

  def approve
    current_cat_rental_request.approve!
    redirect_to cat_url(current_cat)
  end

  def deny
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat)
  end

  def current_cat
    current_cat_rental_request.cat
  end

  def current_cat_rental_request
    @rental_request ||= CatRentalRequest.includes(:cat).find(params[:id])
  end

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :end_date, :start_date, :status)
  end

  def require_cat_owner!
    if current_user.try(:id) != current_cat.user_id
      flash[:notice] = "Sorry, you are not authorized to do that action."
      redirect_to root_url
    end
  end

end

