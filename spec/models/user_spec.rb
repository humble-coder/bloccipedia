require 'spec_helper'

describe User do
  describe "#is_wiki_owner?" do
  	it "determines whether a premium user owns a wiki" do
  		user = create(:user, :as_premium_user, :with_private_wiki)
  		wiki = user.wikis.first

  		user.is_wiki_owner?(wiki).should eq(true)
  	end
  end
end
