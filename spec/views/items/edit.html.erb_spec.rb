require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :url => "MyString",
      :author_id => 1,
      :content => "MyText",
      :summary => "MyText",
      :image => "MyString",
      :entry_id => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

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
