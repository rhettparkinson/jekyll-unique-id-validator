# This Jekyll plugin ensures that all posts have a unique ID.
#
# Every time the site is built, this plugin checks if each post has an 'id' key in its frontmatter.
# It then checks if this ID is unique across all posts. If there's a duplicate or if the ID is missing,
# the build process will halt with an error, ensuring the integrity of post IDs.

module Jekyll
  class UniqueIDValidator < Generator
    # This method is the main entry point for the plugin.
    def generate(site)
      # Store all encountered IDs in a Set for fast lookup.
      encountered_ids = Set.new

      # Loop through all the posts.
      site.posts.docs.each do |post|
        # Fetch the ID from the post's frontmatter.
        id = post.data['id']

        # Check if the ID exists and if it has already been encountered.
        if id.nil?
          raise "Post '#{post.title}' does not have an ID!"
        elsif encountered_ids.include?(id)
          raise "Duplicate ID '#{id}' found in post '#{post.title}'!"
        else
          encountered_ids.add(id)
        end
      end
    end
  end
end
