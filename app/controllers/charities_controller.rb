class CharitiesController < ApplicationController

  def index
    @charities = Charity.all
  end

  def new
    @charity = Charity.new
  end

  def show
    @charity = Charity.find(params[:id])
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      flash[:notice] = "charity created"
      redirect_to root_path
    else
      flash[:notice] = "Invalid charity"
      redirect_to new_charity_path
    end

  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      flash[:notice] = "Charity updated"
    else
      flash[:notice]= "update failed"
      redirect_to edit_charity_path(@charity)
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    flash[:notice] = "Your charity has been deleted"
    redirect_to root_path
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :description)
  end
end


