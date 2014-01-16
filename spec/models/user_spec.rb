require 'spec_helper'

describe User do
  describe "#is_wiki_owner?" do
  	it "determines whether a premium user owns a wiki" do
  		User.skip_callback(:create, :after, :set_user)
  		user = create(:user, :as_premium_user)
  		wiki = create(:wiki)
  		user.wikis << wiki

  		user.is_wiki_owner?(wiki).should eq(true)
  	end
  end
end
