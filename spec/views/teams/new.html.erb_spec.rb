require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      name: "MyString",
      tournament: nil,
      status: 1
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input[name=?]", "team[name]"

      assert_select "input[name=?]", "team[tournament_id]"

      assert_select "input[name=?]", "team[status]"
    end
  end
end
