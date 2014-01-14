if Rails.env.test?
  ENV['PUBLISHABLE_KEY'] = 'pk_test_s6clxTJCTWHAPbZEU8kMhnF5'
  ENV['SECRET_KEY'] = 'sk_test_27FkHUMJuMyQIaOZd2IIgt1o'
end
Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]