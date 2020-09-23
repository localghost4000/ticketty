require 'rails_helper'

RSpec.feature "Users can view projects" do
  scenario "with the project details" do
    project = FactoryBot.create(:project, name: "Ruby on Rails")

    visit root_path
    click_link "Ruby on Rails"
    expect(page.current_url).to eq project_url(project)
  end
end
