class AddColumnRestrictions < ActiveRecord::Migration
  def change
    #remove any pre-existing null values
    ShortenedUrl.update_all({url: "invalid"}, {:url => nil})
    ShortenedUrl.update_all({shortened_url: "invalid"}, {:shortened_url => nil})

    change_column :shortened_urls, :url, :string, :null => false
    change_column :shortened_urls, :shortened_url, :string, :null => false
  end
end
