# This Jekyll plugin ensures that all posts have a unique ID.
#
# Every time the site is built, this plugin checks if each post has an 'id' key in its frontmatter.
# It then checks if this ID is unique across all posts. If there's a duplicate or if the ID is missing,
# the build process will halt with an error, ensuring the integrity of post IDs.

module Jekyll
  class UniqueIDValidator < Generator
    # Prints a given error message with red and bold formatting for better visibility in the console.
    def print_error(message)
      # \e[31m sets the text color to red
      # \e[1m makes the text bold
      # \e[0m resets all text attributes to their defaults
      puts "\e[31m\e[1mERROR: #{message}\e[0m"
    end

    # This method is the main entry point for the plugin.
    def generate(site)
      # Store all encountered IDs in a Set for fast lookup.
      encountered_ids = Set.new

      # Loop through all the posts.
      site.posts.docs.each do |post|
        # Fetch the ID from the post's frontmatter.
        id = post.data['id']        
        # Fetch the title from the post's frontmatter.
        title = post.data['title']
        # Check if the ID exists and if it has already been encountered.
        if id.nil?
          print_error("Post '#{title}' does not have an ID!")
          raise "Post ID Error"
        elsif encountered_ids.include?(id)
          print_error("Duplicate ID '#{id}' found in post '#{title}'!")
          raise "Duplicate ID Error"
        else
          encountered_ids.add(id)
        end
      end
    end
  end
end
