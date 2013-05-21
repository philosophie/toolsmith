# Toolsmith

A crafty tool to craft crafty UI's.

## Install

Add Toolsmith to your gemfile:

```ruby
gem "toolsmith"
```

Then...

```bash
$ bundle install
```

## Usage

When including toolsmith CSS and JS, you automatically get the Bootstrap CSS /
JS for free as well.

### SCSS

In your application.scss file, include an import directive like so:

```sass
@import "toolsmith";
```

You also have `toolsmith-responsive` as an option, which includes
`bootstrap-responsive`.

### CoffeeScript

```coffeescript
#= require toolsmith
```

## What do I get?

Toolsmith's aim is to provide very common UI components with simple methods.
Things like Page Headers, Flash messages, etc. It's basically an abstraction
on top of Bootstrap, which seems ridiculous but actually results in cleaner,
more consistent interfaces and codebases.

As an example:

```erb
<%= page_header "Projects", @project.name do |header| %>
  <% header.button title: "Edit", path: edit_project_path(@project), icon: "pencil" %>
  <% header.button title: "Delete", path: project_path(@project), icon: "trash", anchor: anchor: { method: :delete, confirm: "Are you sure?" } %>
<% end %>

```

Gives you something like this for free:
![Page Header Example](http://i.imgur.com/ycXzDR1.png)

Clearly we have a lot more documentation to write.
