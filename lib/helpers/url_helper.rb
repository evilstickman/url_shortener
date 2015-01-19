require 'shortened_url'

class UrlHelper

	def get_unique_url_token
    retval = generate_url_token()
    while(ShortenedUrl.exists?({shortened_url: retval})) do 
      retval = generate_url_token()
    end
    retval
  end

	def generate_url_token
    # Generate an 8-character hex string at random. This provides > 4 billion unique values
    SecureRandom.hex(4)
	end

end
