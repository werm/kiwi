require 'spec_helper'

describe "snippets/index" do
  before(:each) do
    assign(:snippets, [
      stub_model(Snippet,
        :name => "Name",
        :html => "MyText",
        :css => "MyText"
      ),
      stub_model(Snippet,
        :name => "Name",
        :html => "MyText",
        :css => "MyText"
      )
    ])
  end

  it "renders a list of snippets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
