module MiniTestSpecRails
  module Init
    module ActiveSupportBehavior

      def self.included(klass)
        klass.class_eval do
          extend MiniTest::Spec::DSL
          include MiniTestSpecRails::DSL
          register_spec_type(self) { |desc| Class === desc && desc < ActiveRecord::Base if defined?(ActiveRecord::Base) }
          register_rails_test_case self
        end
      end

    end
  end
end

ActiveSupport::TestCase.send :include, MiniTestSpecRails::Init::ActiveSupportBehavior


# The AbstractController::Helpers#default_helper_module! blows up using
# ActiveSupport's modified LoadError class under Ruby 1.8 because describe
# blocks with spaces for their names have a `module_path` of something like
# "nested 1" while in Ruby 1.9 it is something like "#<Class:0x007fa256ea1118>"
# and hence wont find a #path match in REGEXPS due to the space. So add
# another that allows filenames with spaces in it.
#
MissingSourceFile::REGEXPS << %r{^Missing \w+ (?:file\s*)?(.*\.rb)$}i