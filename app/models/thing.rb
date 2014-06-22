class Thing < ActiveRecord::Base
  validates_presence_of name

  mount_uploader :image, ImageUploader
  after_create :check_for_bounties



  def check_for_bounties
    Bounty.where(name: name, found: false).each do |bounty|

      bounty.update_attribute(:found, true)
      BountyMailer.bounty_found(bounty, self).deliver

    end
  end


end
