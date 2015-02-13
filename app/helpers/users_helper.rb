module UsersHelper

	def profile_image_for(user)
  	url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}"
  	image_tag(url, alt: user.name)
	end
	# To request the associated profile image that's stored on Gravatar's site, we use a URL with the form http://secure.gravatar.com/avatar/gravatar-id where the gravatar-id part is replaced with a particular user's gravatar id. To actually show a profile image on his profile page, we need to generate an image tag for the image that lives on Gravatar's site. To do that, write a custom view helper called profile_image_for that takes a user object as a parameter. It needs to generate a string that represents the URL for that user's Gravatar image and then use that URL to generate and return an image tag for the image. Put the helper method in the users_helper.rb file.

end
