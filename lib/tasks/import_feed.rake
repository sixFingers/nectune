task :import_feed => :environment do
  Source.all.each do |source|
    items_created = 0
    feed = Feedjira::Feed.fetch_and_parse(source.feed_url)
    feed.entries.each do |entry|
      author = Author.new(
        name: entry.author,
        source: source
      )

      author.save

      categories = []
      entry.categories.each do |name|
        category = Category.new(
          name: name,
          authorable: author
        )

        category.save
        categories << category
      end

      item = Item.new(
        title: entry.title,
        url: entry.url,
        author: author,
        content: entry.content,
        summary: entry.summary,
        image: entry.image,
        published: entry.published,
        updated: entry.updated,
        entry_id: entry.entry_id,
        categories: categories
      )

      if item.save
        items_created += 1
      end
    end

    puts "Added " + items_created.to_s + " items from " + source.title
  end
end
