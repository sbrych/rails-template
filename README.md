# sbrych/rails-template (fork of mattbrictson/rails-template)

## Requirements

This template currently works with:

* Rails 5.2.x
* PostgreSQL

## Installation

*Optional.*

To make this the default Rails application template on your system, create a `~/.railsrc` file with these contents:

```
-d postgresql
-m https://raw.githubusercontent.com/sbrych/rails-template/master/template.rb
```

## Usage

To generate a Rails application using this template, pass the `-m` option to `rails new`, like this:

```
rails new blog \
  -d postgresql \
  -m https://raw.githubusercontent.com/sbrych/rails-template/master/template.rb
```

*Remember that options must go after the name of the application.* The only database supported by this template is `postgresql`.

If you’ve installed this template as your default (using `~/.railsrc` as described above), then all you have to do is run:

```
rails new blog
```

## What does it do?

The template will perform the following steps:

1. Generate your application files and directories
2. Ensure bundler is installed
3. Create the development and test databases

## What is included?

#### These gems are added to the standard Rails stack

* Core
    * ~~[active_type][] – for building simple and effective form/service objects~~
    * [sidekiq][] – Redis-based job queue implementation for Active Job
* Configuration
    * [dotenv][] – in place of the Rails `secrets.yml`
* Utilities
    * [annotate][] – auto-generates schema documentation
    * [autoprefixer-rails][] – automates cross-browser CSS compatibility
    * [awesome_print][] – try `ap` instead of `puts`
    * [better_errors][] – useful error pages with interactive stack traces
    * [guard][] – runs tests as you develop; mandatory for effective TDD
    * [livereload][] – magically refreshes browsers whenever you save a file
    * [rubocop][] – enforces Ruby code style
    * [xray-rails][] – inspect view partials in the browser
* Security
    * [brakeman][] and [bundler-audit][] – detect security vulnerabilities
* Testing
    * [simplecov][] – code coverage reports
    * [shoulda][] – shortcuts for common ActiveRecord tests

#### Bootstrap integration (optional)

[Bootstrap][]-related features are opt-in. To apply these to your project, answer "yes" when prompted.

* Bootstrap-themed scaffold templates
* Application layout that includes Bootstrap-style navbar and boilerplate
* View helpers for generating common Bootstrap markup

#### Other tweaks that patch over some Rails shortcomings

* A much-improved `bin/setup` script
* Log rotation so that development and test Rails logs don’t grow out of control

#### Plus lots of documentation for your project

* `README.md`

## How does it work?

This project works by hooking into the standard Rails [application templates][] system, with some caveats. The entry point is the [template.rb][] file in the root of this repository.

Normally, Rails only allows a single file to be specified as an application template (i.e. using the `-m <URL>` option). To work around this limitation, the first step this template performs is a `git clone` of the `sbrych/rails-template` repository to a local temporary directory.

This temporary directory is then added to the `source_paths` of the Rails generator system, allowing all of its ERb templates and files to be referenced when the application template script is evaluated.

Rails generators are very lightly documented; what you’ll find is that most of the heavy lifting is done by [Thor][]. The most common methods used by this template are Thor’s `copy_file`, `template`, and `gsub_file`. You can dig into the well-organized and well-documented [Thor source code][thor] to learn more.

[active_type]:https://github.com/makandra/active_type
[sidekiq]:http://sidekiq.org
[dotenv]:https://github.com/bkeepers/dotenv
[annotate]:https://github.com/ctran/annotate_models
[autoprefixer-rails]:https://github.com/ai/autoprefixer-rails
[awesome_print]:https://github.com/michaeldv/awesome_print
[better_errors]:https://github.com/charliesome/better_errors
[guard]:https://github.com/guard/guard
[livereload]:https://github.com/guard/guard-livereload
[rubocop]:https://github.com/bbatsov/rubocop
[xray-rails]:https://github.com/brentd/xray-rails
[unicorn]:http://unicorn.bogomips.org
[unicorn-worker-killer]:https://github.com/kzk/unicorn-worker-killer
[Postmark]:http://postmarkapp.com
[postmark-rails]:http://www.rubydoc.info/gems/postmark-rails/0.12.0
[brakeman]:https://github.com/presidentbeef/brakeman
[bundler-audit]:https://github.com/rubysec/bundler-audit
[mocha]:https://github.com/freerange/mocha
[shoulda]:https://github.com/thoughtbot/shoulda
[simplecov]:https://github.com/colszowka/simplecov
[Bootstrap]:http://getbootstrap.com
[application templates]:http://guides.rubyonrails.org/generators.html#application-templates
[template.rb]: template.rb
[thor]: https://github.com/erikhuda/thor
