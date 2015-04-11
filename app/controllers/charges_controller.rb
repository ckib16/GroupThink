class ChargesController < ApplicationController

  before_action :membership_price

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership",
      amount: @premium
    }
  end

  def create
    #Creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )

    #Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, #different than user_id
      amount: @premium,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
      )

    # add code: if current_user is upgraded = change role to premium
    current_user.role = 'premium'

    flash[:success] = "Thank you for your payment #{current_user.email}!"
    redirect_to edit_user_registration_path


    #Rescue block catches and displays errors
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    end

  private
  def membership_price
    #price in cents
    @premium = 1000
  end

end
