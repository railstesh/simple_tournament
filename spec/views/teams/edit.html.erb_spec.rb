require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      name: "MyString",
      tournament: nil,
      status: 1
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input[name=?]", "team[name]"

      assert_select "input[name=?]", "team[tournament_id]"

      assert_select "input[name=?]", "team[status]"
    end
  end
end
