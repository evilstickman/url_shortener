class AddIndicesToShortenedUrls < ActiveRecord::Migration
  def change
  	add_index :shortened_urls, :id
  	add_index :shortened_urls, :shortened_url
  end
end
