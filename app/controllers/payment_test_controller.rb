class PaymentTestController < ApplicationController


  def create_paypal_bounty

  @api = PayPal::SDK::AdaptivePayments::API.new
  session[:bounty_id] = params[:bounty_id]
  bounty = Bounty.find(session[:bounty_id])
  # Build request object
  @preapproval = @api.build_preapproval({
    :cancelUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/preapproval",
    :currencyCode => "EUR",
    :maxTotalAmountOfAllPayments => bounty.reward,
    :returnUrl => "http://localhost:3000/",
    :ipnNotificationUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify",
    :startingDate => "#{Time.now}" })

  # Make API call & get response
  @preapproval_response = @api.preapproval(@preapproval)

  # Access Response
    if @preapproval_response.success?
      session[:preapprovalkey] = @preapproval_response.preapprovalKey
      
      bounty.update_attribute(:preapproval_key, @preapproval_response.preapprovalKey)

        redirect_to "https://www.sandbox.paypal.com/webscr?cmd=_ap-preapproval&preapprovalkey=#{@preapproval_response.preapprovalKey}"
    else
        raise @preapproval_response.error.inspect
      
    end
  end 

  def pay_bounty
    @api = PayPal::SDK::AdaptivePayments::API.new
    @bounty = Bounty.find(session[:bounty_id])
    thing = Thing.where(name: @bounty.name).first
    # Build request object
    @pay = @api.build_pay({
      :actionType => "PAY",
      :cancelUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay",
      :currencyCode => "EUR",

      :ipnNotificationUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify",
      :preapprovalKey => Bounty.find(session[:bounty_id]).preapproval_key,
      :receiverList => {
        :receiver => [{
          :amount => @bounty.reward,
          :email => thing.email }] },
      :senderEmail => "felixweberizer-facilitator@gmail.com",
      :returnUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay",
      })
    # Make API call & get response
     @pay_response = @api.pay(@pay)

    if @pay_response.success?
      redirect_to thing, notice: 'Your reward has been transferred to the bounty hunter! Thanks.'
    else
      raise "Something went wrong :(" 
    end
  end


end

