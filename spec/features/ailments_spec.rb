require 'rails_helper'

feature "Ailments", type: :feature do
  before do
    @ailment = create(:ailment)
  end

  scenario "List all ailments" do
    visit ailments_path
    expect(page).to have_content @ailment.name
  end

  scenario "Create ailment" do
    visit new_ailment_path
    fill_in "Name", with: "eye trouble"
    fill_in "Description", with: "eye trouble"
    click_button 'Create Ailment'
    expect(Ailment.last.name).to eq("eye trouble")
    expect(Ailment.last.description).to eq("eye trouble")
  end

  scenario "Edit ailment" do
    visit edit_ailment_path(@ailment)
    fill_in "Name", with: "eye sore"
    click_button 'Update Ailment'
    expect(Ailment.last.name).to eq("eye sore")
    expect(Ailment.last.description).to eq(@ailment.description)
  end
end
