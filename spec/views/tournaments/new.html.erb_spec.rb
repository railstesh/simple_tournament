require 'rails_helper'

RSpec.describe "tournaments/new", type: :view do
  before(:each) do
    assign(:tournament, Tournament.new(
      name: "MyString"
    ))
  end

  it "renders new tournament form" do
    render

    assert_select "form[action=?][method=?]", tournaments_path, "post" do

      assert_select "input[name=?]", "tournament[name]"
    end
  end
end
