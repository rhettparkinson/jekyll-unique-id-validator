# This Jekyll plugin ensures that all posts have a unique ID (uid).
#
# Every time the site is built, this plugin checks if each post has an 'uid' key in its frontmatter.
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
      # Store all encountered UIDs in a Set for fast lookup.
      encountered_uids = Set.new

      # Loop through all the posts.
      site.posts.docs.each do |post|
        # Fetch the UID from the post's frontmatter.
        uid = post.data['uid']        
        # Fetch the title from the post's frontmatter.
        title = post.data['title']
        # Check if the UID exists and if it has already been encountered.
        if uid.nil?
          print_error("Post '#{title}' does not have an UID!")
          raise "Post UID Error"
        elsif encountered_ids.include?(id)
          print_error("Duplicate UID '#{id}' found in post '#{title}'!")
          raise "Duplicate UID Error"
        else
          encountered_uids.add(uid)
        end
      end
    end
  end
end
