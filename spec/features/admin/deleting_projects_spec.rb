require 'rails_helper'

RSpec.feature "Users can delete projects" do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end

  scenario "successfully" do
    FactoryBot.create(:project, name: "Ruby on Rails")

    visit root_path
    click_link "Ruby on Rails"
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted."
    expect(current_url).to eq projects_url
    expect(page).to_not have_content "Ruby on Rails"
  end
end
