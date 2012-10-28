Feature:
  In order to save the world
  As an open-source evangelist
  I want everyone to use Cloudfront-private and its generators.
  
  Scenario: cloudfront:install generator bootstraps the basic files
    Given I run "rails new my_app"
    And I cd to "my_app"
    And a file named "Gemfile" with:
    """
    source "http://rubygems.org"
    gem 'rails'
    gem 'sqlite3'
    gem 'cloudfront-private', :path => '../../../'
    """
    When I run "bundle install"
    And I run "rails generate cloudfront:install"
    Then the following files should exist:
      | config/initializers/cloudfront-private.rb |
