require 'spec_helper'

describe "snippets/new" do
  before(:each) do
    assign(:snippet, stub_model(Snippet,
      :name => "MyString",
      :html => "MyText",
      :css => "MyText"
    ).as_new_record)
  end

  it "renders new snippet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => snippets_path, :method => "post" do
      assert_select "input#snippet_name", :name => "snippet[name]"
      assert_select "textarea#snippet_html", :name => "snippet[html]"
      assert_select "textarea#snippet_css", :name => "snippet[css]"
    end
  end
end
