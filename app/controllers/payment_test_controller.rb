class PaymentTestController < ApplicationController


  def create_paypal_bounty

  @api = PayPal::SDK::AdaptivePayments::API.new

  # Build request object
  @preapproval = @api.build_preapproval({
    :cancelUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/preapproval",
    :currencyCode => "EUR",
    :maxTotalAmountOfAllPayments => 20.0,
    :returnUrl => "http://localhost:3000/payment_test/pay_bounty",
    :ipnNotificationUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify",
    :startingDate => "#{Time.now}" })

  # Make API call & get response
  @preapproval_response = @api.preapproval(@preapproval)

  # Access Response
    if @preapproval_response.success?
       session[:preapprovalkey] = @preapproval_response.preapprovalKey
        redirect_to "https://www.sandbox.paypal.com/webscr?cmd=_ap-preapproval&preapprovalkey=#{@preapproval_response.preapprovalKey}"
    else
        raise @preapproval_response.error.inspect
      
    end
  end 

  def pay_bounty
    @api = PayPal::SDK::AdaptivePayments::API.new

    # Build request object
    @pay = @api.build_pay({
      :actionType => "PAY",
      :cancelUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay",
      :currencyCode => "EUR",

      :ipnNotificationUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify",
      :preapprovalKey => session[:preapprovalkey],
      :receiverList => {
        :receiver => [{
          :amount => 1.0,
          :email => "platfo_1255612361_per@gmail.com" }] },
      :senderEmail => "felixweberizer-facilitator@gmail.com",
      :returnUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay",
      })

    # Make API call & get response
     @pay_response = @api.pay(@pay)

     raise @pay_response.inspect
  end


end

