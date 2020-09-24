require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    ror = FactoryBot.create(:project, name: "Ruby on Rails")
    FactoryBot.create(:ticket, project: ror,
                      name: "More rails",
                      description: "There aren't enough rails.")

    node = FactoryBot.create(:project, name: "node.js")
    FactoryBot.create(:ticket, project: node,
                      name: "Rewrite it in Rust",
                      description: "It's time to rewrite it in Rust.")

    visit root_path
  end

  scenario "for a given project" do
    click_link "Ruby on Rails"

    expect(page).to have_content "More rails"
    expect(page).to_not have_content "Rewrite it in Rust"
  
    click_link "More rails"
    within("#ticket h2") do
      expect(page).to have_content "More rails"
    end

    expect(page).to have_content "There aren't enough rails."
  end
end
