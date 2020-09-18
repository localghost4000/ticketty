require 'rails_helper'

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit root_path

    click_link "New Project"

    fill_in "Name", with: "Ruby on Rails"
    fill_in "Description", with: "Web application framework."
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end
end
