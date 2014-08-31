require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :title => "Title",
        :url => "Url",
        :author_id => 1,
        :content => "MyText",
        :summary => "MyText",
        :image => "Image",
        :entry_id => 2
      ),
      Item.create!(
        :title => "Title",
        :url => "Url",
        :author_id => 1,
        :content => "MyText",
        :summary => "MyText",
        :image => "Image",
        :entry_id => 2
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
