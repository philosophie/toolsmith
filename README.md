= Toolsmith

A crafty tool to craft crafty UI's.

### Install

In your gemfile, specify the pricvate gem source. You can find our private source in http://know.gophilosophie.com

```ruby
if ENV["TOOLSMITH_GEM_URL"]
  source ENV["TOOLSMITH_GEM_URL"]
else
  raise "Missing ENV var \"TOOLSMITH_GEM_URL\". Please see the README"
end

```

In your projects gemfile, slap this in there:

```
gem "toolsmith", "~> 0.0.1"
```

Then...

```bundle install```

Profit.