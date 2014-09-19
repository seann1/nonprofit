class Donation < ActiveRecord::Base
  validates_presence_of :name, presence: :true

  def charge_card
    begin
      Stripe.api_key = "sk_test_htCgoOmkpccvOtvsgYCRDM6C"
      charge = Stripe::Charge.create(
        :amount => self.amount, # amount in cents, again
        :currency => "usd",
        :card => self.token,
        :description => self.user.email
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end

end
