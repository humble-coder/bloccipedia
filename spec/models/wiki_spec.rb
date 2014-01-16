require 'spec_helper'

describe Wiki do
  describe "#set_public_attribute - a before_create callback private method" do
  	it "sets public to true if it's not otherwise specified" do
  		public_wiki = create(:wiki)

  		public_wiki.public.should eq(true)
  	end
  	it "leaves public at false when the wiki is private" do
  		private_wiki = create(:wiki, :as_private)

  		private_wiki.public.should eq(false)
  	end
  end
end