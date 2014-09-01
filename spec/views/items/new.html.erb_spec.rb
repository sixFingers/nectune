require 'rails_helper'

RSpec.describe "items/new", :type => :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :url => "MyString",
      :author_id => 1,
      :content => "MyText",
      :summary => "MyText",
      :image => "MyString",
      :entry_id => 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "input#item_url[name=?]", "item[url]"

      assert_select "input#item_author_id[name=?]", "item[author_id]"

      assert_select "textarea#item_content[name=?]", "item[content]"

      assert_select "textarea#item_summary[name=?]", "item[summary]"

      assert_select "input#item_image[name=?]", "item[image]"

      assert_select "input#item_entry_id[name=?]", "item[entry_id]"
    end
  end
end
