require "rails_helper"

feature "user can manage tv listings" do
	scenario "user can do everything"	 do
		visit root_path

		click_on "Add New Channel"
		expect(current_path).to eq(new_channel_path)

		fill_in "Name", with: "Channel 12"

		click_on "Save New Channel"
		expect(page).to have_content("Channel 12 Successfully Added")
		expect(current_path).to eq(root_path)

		click_on "Add New Show"

		fill_in "Name", with: "Return of the Jedi"
		click_on "Create Show"

		expect(page).to have_content("Return of the Jedi Successfully Added")
		expect(page).to have_content("No Show Listings for Return of the Jedi")
		expect(current_path).to eq show_path(Show.last)

		click_on "Edit"
		expect(current_path).to eq edit_show_path(Show.last)

		fill_in "Name", with: "Revenge of the Semicolon"

		click_on "Update Show"

		expect(page).to have_content("Revenge of the Semicolon Successfully Updated")
		expect(page).to have_content("No Show Listings for Revenge of the Semicolon")
		expect(current_path).to eq(show_path(Show.last))

		click_on "New Show Listing"
		expect(current_path).to eq(new_show_listing_path)

		select "Channel 12", from: "Channels"
		select "Revenge of the Semicolon", from: "Shows"
		fill_in "Date", with: "11/11/2011"

		click_on "Create Show Listing"

		expect(page).to have_content("Show Listing Successfully Added")
		expect(current_path).to eq(show_path(Show.last))

		expect(page).to have_content("Revenge of the Semicolon is showing on Channel 12 on 11/11/2011")
		expect(page).to_not have_content("No Show Listings for Revenge of the Semicolon")
	end
end