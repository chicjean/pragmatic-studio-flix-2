#To test the sign-out process, the spec first needs to sign a user in. Other specs we'll write later will also need to sign a user in. To avoid duplicating the sign-in steps in the specs, we defined a sign_in support method. Given a user, it simply fills in the sign-in form for that user and hits the submit button. Put this method in a file called authentication.rb in your spec/support directory.

def sign_in(user)

	visit new_session_url 

	fill_in "Email", with: user.email
	fill_in "Password", with: user.password

	click_button "Sign In"

end