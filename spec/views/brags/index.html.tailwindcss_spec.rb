require 'rails_helper'

RSpec.describe "brags/index", type: :view do
  it "renders the brags page" do
    render
    expect(rendered).to match(/🎯 Chaiyo’s Brag Document/)
    expect(rendered).to match(/กลับหน้าหลัก/)
  end
end
