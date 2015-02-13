require 'spec_helper'

describe "Viewing a list of users" do 

	it "shows a list of users" do 
		user1 = User.create!(user_attributes(name: "Larry", email: "larry@example.com", username: "larrystooge"))
    user2 = User.create!(user_attributes(name: "Moe",   email: "moe@example.com", username: "moestooge"))
    user3 = User.create!(user_attributes(name: "Curly", email: "curly@example.com", username: "curleystooge"))

    sign_in(user1)

    visit users_url

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user3.name)
	end

end