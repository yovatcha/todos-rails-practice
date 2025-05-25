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

  it "renders a list of quests" do
    render
    expect(rendered).to match(/First Quest/)
    expect(rendered).to match(/Second Quest/)
    expect(rendered).to match(/No/)
  end
end
