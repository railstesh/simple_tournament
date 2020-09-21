require 'rails_helper'

RSpec.describe "tournaments/show", type: :view do
  before(:each) do
    @tournament = assign(:tournament, Tournament.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
