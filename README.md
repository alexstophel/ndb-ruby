[![Code Climate](https://codeclimate.com/github/alexstophel/ndb-ruby/badges/gpa.svg)](https://codeclimate.com/github/alexstophel/ndb-ruby)
[![Test Coverage](https://codeclimate.com/github/alexstophel/ndb-ruby/badges/coverage.svg)](https://codeclimate.com/github/alexstophel/ndb-ruby/coverage)
[![Build Status](https://travis-ci.org/alexstophel/ndb-ruby.svg?branch=master)](https://travis-ci.org/alexstophel/ndb-ruby)

# NDB-Ruby

This is a simple ruby wrapper around the National Nutrient Database REST API
provided by the United States Department of Agriculture. In general, all of the
parameters accepted by the API can be specified through the methods in this gem.

This gem assumes that you want data returned in JSON format. There may be
support for XML in the future.

## Setting your API Key

If you're using Rails, you can set up your API in an initializer like this:

```ruby
# config/initializer/ndb-api.rb
NDB.configure do |config|
  config.api_key = ENV["OPEN_GOV_API_KEY"]
end
```

## Search

The Search request is wrapped in a simple ```.perform``` method on
```NDB::Search``` and can be used like so:

```ruby
NDB::Search.perform(q: "butter")
```

It takes all of the options mentioned in the Search API documentation, except
the format option.

## List

The List request is wrapped in a simple ```.retrieve``` method on
```NDB::List``` and can be used like so:

```ruby
NDB::List.retrieve(lt: "n")
```

It takes all of the options mentioned in the List API documentation, except for
the format option.

## Food Report

The Food Report request is wrapped in a simple ```.retrieve``` method on
```NDB::FoodReport``` and can be used like so:

```ruby
NDB::FoodReport.retrieve(ndbno: "01009", type: "b")
```

It takes all of the options mentioned in the Food Report API documentations,
except for the format option.
