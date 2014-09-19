class DonationsController < ApplicationController

  def index
    @dontaions = Donation.all
  end

  def new
    @donation = Donation.new
    @charity = Charity.find(params[:charity_id])
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def create
    @charity = Charity.find(params[:charity_id])
    @donation = Donation.new({:charity_id => @charity.id, :token => params[:token]})
    if @donation.save
      card = Stripe.card.createToken
      card.charge_card

      flash[:notice] = "donation created"
      redirect_to root_path
    else
      flash[:notice] = "Invalid donation"
      redirect_to charity_path(@charity)
    end

  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])
    if @donation.update(donation_params)
      flash[:notice] = "Donation updated"
    else
      flash[:notice]= "update failed"
      redirect_to edit_donation_path(@donation)
    end
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    flash[:notice] = "Your donation has been deleted"
    redirect_to root_path
  end
end
