require 'spec_helper'

describe "Signing in" do

  it "prompts for an email and password" do
    visit root_url

    click_link 'Sign In'

    expect(current_path).to eq(new_session_path)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end

  it "signs in the user if the email/password combination is valid" do
  #One example should test what happens when a user signs in using a valid email/password combination. 
  	user = User.create!(user_attributes)

  	visit root_url

  	click_link 'Sign In'

  	fill_in "Email", with: user.email
  	fill_in "Password", with: user.password

  	click_button "Sign In"

  	expect(current_path).to eq(user_path(user))

  	expect(page).to have_text("Welcome back, #{user.name}!")
    expect(page).to have_link(user.name)
    expect(page).to have_link('Sign Out')
    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
	end

	it "does not sign in the user if the email/password combination is invalid" do
  #And the other example should cover the case where the email/password combination is invalid.
  	user = User.create!(user_attributes)

  	visit root_url

  	click_link 'Sign In'

  	fill_in "Email", with: user.email
  	fill_in "Password", with: "no match"

  	click_button 'Sign In'

  	expect(page).to have_text("Invalid")
    expect(page).not_to have_link(user.name)
    expect(page).not_to have_link('Sign Out')
    expect(page).to have_link('Sign In')
    expect(page).to have_link('Sign Up')
	end

  it "redirects to the intended page" do 
    user = User.create!(user_attributes)

    visit users_url

    expect(current_path).to eq(new_session_path)

    sign_in(user)

    expect(current_path).to eq(users_path)
  end

end

# Signing in is a new feature, and as such it deserves its own feature spec. We'll put it in a new spec/features/sign_in_spec.rb file. In that file, write an example that expects clicking a "Sign In" link to show a form with email and password fields. Hint: You can use the have_field matcher method in Capybara to check that those fields are present on the page. Try writing the spec yourself first, then click the link below if you want to see our version.