require 'spec_helper'

describe "snippets/edit" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet,
      :name => "MyString",
      :html => "MyText",
      :css => "MyText"
    ))
  end

  it "renders the edit snippet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => snippets_path(@snippet), :method => "post" do
      assert_select "input#snippet_name", :name => "snippet[name]"
      assert_select "textarea#snippet_html", :name => "snippet[html]"
      assert_select "textarea#snippet_css", :name => "snippet[css]"
    end
  end
end
