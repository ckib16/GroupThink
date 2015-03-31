require 'rails_helper'

RSpec.describe "wikis/show", type: :view do
  before(:each) do
    @wiki = assign(:wiki, Wiki.create!(
      :title => "Title",
      :body => "MyText",
      :private => false,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
