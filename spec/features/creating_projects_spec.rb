require 'rails_helper'

RSpec.feature "Users can create new projects" do
  before do
    visit root_path

    click_link "New Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Ruby on Rails"
    fill_in "Description", with: "Ruby but it's on rails."
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by!(name: "Ruby on Rails")
    expect(page.current_url).to eq project_url(project)

    title = "Ruby on Rails - Projects - Ticketty"
    expect(page).to have_title title
  end
  
  scenario "when providing invalid attributes" do
    click_button "Create Project"

    expect(page).to have_content "Couldn't create project."
    expect(page).to have_content "Name can't be blank"
  end
end
