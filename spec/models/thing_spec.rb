require 'rails_helper'

describe Thing, "new" do 
  it "should have a name field" do
    thing = Thing.new(name: "something")
    expect(thing.name).to eq("something")
  end

  context "notify bounties" do
    it "should call the #check_for_bounties on create" do
      thing = FactoryGirl.build(:thing, name: "something")
      expect(thing).to receive(:check_for_bounties)
      thing.save
    end


    it "should update bounties that match" do
      bounty = FactoryGirl.create(:bounty, name: "toast")
      FactoryGirl.create(:thing, name: "toast")
      expect(bounty.reload.found).to eq true
    end

    it "should only send emails for unfound bounties" do
      unfound_bounty = FactoryGirl.create(:bounty, name: "toast")
      found_bounty   = FactoryGirl.create(:bounty, name: "toast", found: true)
      
      expect(BountyMailer).to receive(:bounty_found).once.and_call_original

      FactoryGirl.create(:thing, name: "toast")
    end



  end

end