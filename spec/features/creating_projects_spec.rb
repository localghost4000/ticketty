require 'rails_helper'

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit root_path

    click_link "New Project"

    fill_in "Name", with: "Ruby on Rails"
    fill_in "Description", with: "Like regular Ruby but it's on rails."
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by!(name: "Ruby on Rails")
    expect(page.current_url).to eq project_url(project)

    title = "Ruby on Rails - Projects - Ticketty"
    expect(page).to have_title title
  end
end
