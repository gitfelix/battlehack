class Thing < ActiveRecord::Base
   mount_uploader :image, ImageUploader
   after_create :check_for_bounties

  def check_for_bounties
    Bounty.where(name: name, found: false).each do |bounty|

      bounty.update_attribute(:found, true)
      ActionMailer::Base.mail(:from => 'from@domain.com', :to => bounty.email,  :subject => "Your Item was Found!", :body => bounty.name).deliver

    end
  end


end
