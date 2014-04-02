require 'spec_helper'

describe "datasets/new" do
  before(:each) do
    assign(:dataset, stub_model(Dataset,
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new dataset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", datasets_path, "post" do
      assert_select "input#dataset_name[name=?]", "dataset[name]"
      assert_select "textarea#dataset_description[name=?]", "dataset[description]"
      assert_select "input#dataset_user[name=?]", "dataset[user]"
    end
  end
end
