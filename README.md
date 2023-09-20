# jekyll-unique-id-validator

`jekyll-unique-id-validator` is a Jekyll plugin that ensures each post has a unique ID in its frontmatter. This plugin helps prevent content inconsistencies by halting the build process if duplicate or missing IDs are detected. It's especially useful for Jekyll websites where post unique IDs are manually assigned and serve crucial functions like referencing in databases.

## Installation

1. Download `jekyll-unique-id-validator.rb` from this repository.
2. Place the downloaded file into your Jekyll site's `_plugins` directory.
   
If your Jekyll project doesn't have a `_plugins` directory, simply create one at the root level and then place the plugin file there.

## Usage

After installation, the plugin will automatically check for post's unique ID every time you build your Jekyll site. If any post is missing a unique ID or if there are duplicate unique IDs, the build will fail, and an error message will be displayed, pointing out the issue.

### Frontmatter Format

For the plugin to work correctly, ensure each post has a `uid` in its frontmatter:
```yaml
---
uid: "001"
title: "Sample Post"
---
```

### Contributing

Pull requests are welcome! If you have improvements or encounter any issues, please report them as GitHub issues.
