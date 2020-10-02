require "rails_helper"

RSpec.feature "Users can edit existing tickets" do
  let(:author) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project) }
  let(:ticket) do
    FactoryBot.create(:ticket, project: project, author: author)
  end

  before do
    visit project_ticket_path(project, ticket)
  end

  scenario "with valid attributes" do
    click_link "Edit Ticket"
    fill_in "Name", with: "Make it really shiny!"
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has been updated."

    within(".ticket h2") do
      expect(page).to have_content "Make it really shiny!"
      expect(page).to_not have_content ticket.name
    end
  end

  scenario "with invalid attributes" do
    click_link "Edit Ticket"
    fill_in "Name", with: ""
    click_button "Update Ticket"

    expect(page).to have_content "Couldn't update ticket."
  end

  scenario "with multiple attachments", js: true do
    click_link "Edit Ticket"
    attach_file("spec/fixtures/spin.txt", class: 'dz-hidden-input', visible: false)
    expect(page).to have_content "spin.txt"

    click_button "Update Ticket"

    expect(page).to have_content "Ticket has been updated."

    within(".ticket .attachments") do
      expect(page).to have_content "spin.txt"
    end
  end
end
