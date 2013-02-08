# Toolsmith

A crafty tool to craft crafty UI's.

### Install

In your projects gemfile, slap this in there:

```
gem "toolsmith"
```

Then...

```bundle install```

Profit.


### Usage

When including toolsmith CSS and JS, you automatically get the Bootstrap CSS / JS for free as well.

#### CSS

In your application.scss file, include an import directive like so:

```sass
import "toolsmith";
```

You also have ```toolsmith-responsive``` has an option, which includes `bootstrap-responsive` and any other responsive designs provided.

#### Javascript

```js
#= require toolsmith
```


### What do I get?

Toolsmith's aim is to provide very common UI components with simple methods. Things like Page Headers, Flash messages, etc...

As an example:

```erb
<%= page_header "Projects", @project.name do |header| %>
  <% header.button title: "Edit", path: edit_project_path(@project), icon: "pencil" %>
  <% header.button title: "Delete", path: project_path(@project), icon: "trash", anchor: anchor: { method: :delete, confirm: "Are you sure?" } %>
<% end %>

```

Gives you something like this for free:
![Page Header Example](http://i.imgur.com/ycXzDR1.png)
