# jekyll-unique-id-validator

`jekyll-unique-id-validator` is a Jekyll plugin that ensures each post has a unique ID in its frontmatter. This plugin helps prevent content inconsistencies by halting the build process if duplicate or missing IDs are detected. It's especially useful for Jekyll websites where post IDs are manually assigned and serve crucial functions like referencing in databases.

## Installation

1. Add the following to your site's Gemfile:
```bash
gem "jekyll-unique-id-validator"
```
2. Then, run:
```bash
bundle install
```
3. Add the plugin to your site's `_config.yml`:
```yaml
plugins:
  - jekyll-unique-id-validator
```

## Usage

After installation, the plugin will automatically check for post IDs every time you build your Jekyll site. If any post is missing an ID or if there are duplicate IDs, the build will fail, and an error message will be displayed, pointing out the issue.

### Frontmatter Format

For the plugin to work correctly, ensure each post has an `id` in its frontmatter:
```yaml
---
id: 001
title: "Sample Post"
---
```

### Contributing

Pull requests are welcome! If you have improvements or encounter any issues, please report them as GitHub issues.

### License

This project is open source and available under the (MIT License)[https://chat.openai.com/c/LICENSE.md].


