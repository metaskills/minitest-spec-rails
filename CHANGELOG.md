
## v4.3.4

* Add mini_should support and talk about matchers.


## v4.3.3

* Fix MiniTest::Unit::TestCase hack for Rails 4, ignore in Rails 3.


## v4.3.2

* Way better support for controller_class, mailer_class, and helper_class reflection.


## v4.3.1

* Eager load controller_class, mailer_class, and helper_class.


## v4.3.0

* All new MiniTest::Spec for Rails!!! Tested to the hilt!!!
* Track MiniTest's major/minior version number.


## v3.0.7

* Must use MiniTest version ~> 2.1. As 3.x will not work.


## v3.0.6

* Use #constantize vs. #safe_constantize for Rails 3.0 compatability.


## v3.0.5

* Use ActionController::IntegrationTest vs. ActionDispatch::IntegrationTest


## v3.0.4

* Use class app setter for integration tests.


## v3.0.3

* Stronger test case organization where we properly setup functional and integraiton tests
  while also allowing an alternate pure MiniTest::Spec outter file describe block. [Jack Chu]


## v3.0.2

* Remove version deps on minitest since v3 is out. Should work with any v2/3 version.


## v3.0.1

* Add rails to the gemspec.

## v3.0.0

* Initial Release, targeted to Rails 3.x.