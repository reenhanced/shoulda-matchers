module Shoulda
  module Matchers
    if Gem.ruby_version >= Gem::Version.new('1.8') && Gem.ruby_version < Gem::Version.new('1.9')
      require 'test/unit'
      AssertionError = Test::Unit::AssertionFailedError
    elsif defined?(Test::Unit::AssertionFailedError)
      # Test::Unit has been loaded already, so we use it
      AssertionError = Test::Unit::AssertionFailedError
    elsif Gem.ruby_version >= Gem::Version.new("1.9")
      require 'minitest/unit'
      AssertionError = MiniTest::Assertion
    else
      raise 'No unit test library available'
    end
  end
end
