class BountyMailer < ActionMailer::Base
  default from: "itemfound@.com"

  def bounty_found(bounty, thing)
    @bounty = bounty
    @thing = thing
    mail(to: @bounty.email, subject: 'The Thing you were looking for has been found!')
  end

end
