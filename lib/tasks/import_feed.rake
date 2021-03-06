# require 'reverse_markdown'

task :import_feed => :environment do
  Source.all.each do |source|
    items_created = 0
    feed = Feedjira::Feed.fetch_and_parse(source.feed_url)
    feed.entries.each do |entry|
      author = Author.new(
        name: entry.author,
        source: source
      )

      if !author.save
        author = Author.find_by(name: entry.author, source: source)
      end

      categories = []
      # Not all feed items present a 'categories' field
      if entry.categories
        entry.categories.each do |name|
          category = Category.new(
            name: name,
            authorable: author
          )

          begin
            category.save
          rescue
            # Handle ActiveRecord::RecordNotUnique errors,
            # wasn't able to fix this more elegantly
            category = Category.find_by(name: name, authorable: author)
          end

          categories << category
        end
      end

      # Notes
      # - 'image' fields contains invariably images and other media enclosures (eg.: MP3).
      #   This should be handled.

      item = Item.new(
        title: entry.title,
        url: entry.url,
        author: author,
        # content: ReverseMarkdown.convert(entry.content),
        # summary: ReverseMarkdown.convert(entry.summary),
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
