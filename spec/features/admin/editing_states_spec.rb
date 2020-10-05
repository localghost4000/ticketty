require "rails_helper"

RSpec.feature "Admins can edit states" do
  let!(:state) { FactoryBot.create :state, name: "Awesome" }

  before do
    login_as(FactoryBot.create(:user, :admin))
    visit admin_states_path
  end

  scenario "with valid attributes" do
    within list_item("Awesome") do
      click_link "Edit"
    end

    expect(current_path).to eq(edit_admin_state_path(state))

    fill_in "Name", with: "Epic"

    click_button "Update State"

    expect(page).to have_content "Epic"
    expect(page).to_not have_content "Awesome"
  end
end
