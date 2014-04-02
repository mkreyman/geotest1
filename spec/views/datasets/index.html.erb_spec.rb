require 'spec_helper'

describe "datasets/index" do
  before(:each) do
    assign(:datasets, [
      stub_model(Dataset,
        :name => "Name",
        :description => "MyText",
        :user => nil
      ),
      stub_model(Dataset,
        :name => "Name",
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of datasets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
