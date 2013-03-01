# Changelog

## v0.0.14

* Adds more flexibility to the PageHeader#button method to allow definition of button properties based on arguments.
  For Example:

  ```ruby
  header.button "Title", "/path", "icon"
  ```

  This change is backwards compatible with the hash structure option.

## v0.0.13

* Add definition_list_for helper for creating lists with only attribute names.
* Code cleanup

## v0.0.12

* Blank definition lists will now render a &nbsp;

## v0.0.11

* Definition list will make empty values into a single space.

## v0.0.10

* Definition list now captures all marup within it.
* Definition list helper method is now `definition_list` instead of `definitions`

## v0.0.9

* Fix Definition List to include `dl-horizontal` class.
* Fix Page Header to be wrapped in a `page-header` class.

## v0.0.8

* Add default variable definitions.

## v0.0.7

* Allow rows, fullwidth columns, and page headers to get fluid-rows.

## v0.0.6

* Change functionality of Page Headers. Not backwards compatible.

## v0.0.5

* Fixes bug that broke JavaScripts

## v0.0.4

* Move stylesheets to app from vendor

## v0.0.3

* Change SCSS files to have .css.scss extension

## v0.0.2

* Misc. improvements

## v0.0.1

* Initial release
