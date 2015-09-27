[![Code Climate](https://codeclimate.com/github/alexstophel/ndb-ruby/badges/gpa.svg)](https://codeclimate.com/github/alexstophel/ndb-ruby)
[![Test Coverage](https://codeclimate.com/github/alexstophel/ndb-ruby/badges/coverage.svg)](https://codeclimate.com/github/alexstophel/ndb-ruby/coverage)
[![Build Status](https://travis-ci.org/alexstophel/ndb-ruby.svg?branch=master)](https://travis-ci.org/alexstophel/ndb-ruby)
[![Gem Version](https://badge.fury.io/rb/ndb-ruby.svg)](http://badge.fury.io/rb/ndb-ruby)
# NDB-Ruby

This is a simple Ruby wrapper around the National Nutrient Database REST API
provided by the United States Department of Agriculture. In general, all of the
parameters accepted by the API can be specified through the methods in this gem.

This gem assumes that you want data returned in JSON format. There may be
support for XML in the future.

## Getting started

Add the gem to your Gemfile:

```ruby
gem 'ndb-ruby', '~> 0.2.0'
```

## Setting the API Key

All calls to the API require a registered data.gov api_key. If you're using
Rails, you can set up your API in an initializer like this:

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

Full list of options can be found in the [Search
Documentation](http://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md)

## List

The List request is wrapped in a simple ```.retrieve``` method on
```NDB::List``` and can be used like so:

```ruby
NDB::List.retrieve(lt: "n")
```

Full list of options can be found in the [List
Documentation](http://ndb.nal.usda.gov/ndb/doc/apilist/API-LIST.md)

## Food Report

The Food Report request is wrapped in a simple ```.retrieve``` method on
```NDB::FoodReport``` and can be used like so:

```ruby
NDB::FoodReport.retrieve(ndbno: "01009", type: "b")
```

Full list of options can be found in the [Food Report
Documentation](http://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md)

## Nutrient Report

The Nutrient Report request is wrapped in a simple ```.retrieve``` method on
```NDB::NutrientReport``` and can be used like so:

```ruby
NDB::NutrientReport.retrieve(nutrients: ["205", "204])
```

Full list of options can be found in the [Nutrient Report
Documentation](http://ndb.nal.usda.gov/ndb/doc/apilist/API-NUTRIENT-REPORT.md)
