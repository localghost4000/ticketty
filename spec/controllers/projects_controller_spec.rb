require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project correctly" do
    get :show, params: { id: "not-here" }

    expect(response).to redirect_to(projects_path)

    expect(flash[:alert]).to eq "Project not found."
  end
end
