require 'rails_helper'

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryBot.create(:project, name: "Ruby on Rails")

    visit root_path
    click_link "Ruby on Rails"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "VS Code"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "VS Code"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"
    
    expect(page).to have_content "Couldn't update project."
  end
end
