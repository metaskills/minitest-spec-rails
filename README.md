
# MiniTest::Spec For Rails

Make Test::Unit::TestCase a subclass of of MiniTest::Spec with this simple shim. Tricks ActiveSupport::TestCase to use MiniTest::Spec instead. Includes any monkey patches to make using MiniTest::Spec a drop in behavior change for any Rails 3.x project. Full Details here:

http://metaskills.net/2011/03/26/using-minitest-spec-with-rails/


# Issues

If there are any issues using this in Rails 3 outside the normal few assertions that change from Test::Unit to MiniTest::Unit, please open an issue here on github.





