require 'rails_helper'

RSpec.describe "quests/index", type: :view do
  before(:each) do
    assign(:quests, [
      Quest.create!(
        name: "First Quest",
        status: false
      ),
      Quest.create!(
        name: "Second Quest",
        status: false
      )
    ])
  end

  it "shows 'No quests found' when there are no quests" do
    assign(:quests, [])
    render
    expect(rendered).to match(/No quests found/)
  end
end
