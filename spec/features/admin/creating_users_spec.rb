require "rails_helper"

RSpec.feature "Admins can create new users" do
  let (:admin) { FactoryBot.create(:user, :admin) }
  
  before do
    login_as(admin)
    visit root_path
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

  scenario "with valid credentials" do
    fill_in "Email", with: "newbie@example.com"
    fill_in "Password", with: "password"
    click_button "Create User"
    expect(page).to have_content "User has been created."
  end
end
