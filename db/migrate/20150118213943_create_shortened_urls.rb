class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :url
      t.string :shortened_url

      t.timestamps null: false
    end
  end
end
