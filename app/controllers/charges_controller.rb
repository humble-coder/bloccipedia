class ChargesController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => current_user.email, #'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    current_user.update_attribute(:premium, true)

  rescue Stripe::CardError => e
    logger.info e.message
    flash[:error] = e.message
    redirect_to charges_path
  end

end

