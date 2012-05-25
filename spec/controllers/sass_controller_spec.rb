require 'spec_helper'

describe SassController do

  describe "GET 'compile'" do
    it "returns http success" do
      get 'compile'
      response.should be_success
    end
  end

end
