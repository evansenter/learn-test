require 'fileutils'
require 'faraday'
require 'oj'
require 'colorize'
require 'pathname'

module LearnTest
  def self.debug?
    @debug ||= false
  end

  def self.debug!
    @debug = true
  end

  def self.debug(&block)
    yield.tap do |result|
      puts result if debug?
    end
  end
end

require_relative 'learn_test/version'
require_relative 'learn_test/netrc_interactor'
require_relative 'learn_test/github_interactor'
require_relative 'learn_test/user_id_parser'
require_relative 'learn_test/username_parser'
require_relative 'learn_test/repo_parser'
require_relative 'learn_test/file_finder'
require_relative 'learn_test/runner'

require_relative 'learn_test/dependency'
require_relative 'learn_test/dependencies/nodejs'
require_relative 'learn_test/dependencies/phantomjs'
require_relative 'learn_test/dependencies/karma'
require_relative 'learn_test/dependencies/protractor'
require_relative 'learn_test/dependencies/java'
require_relative 'learn_test/dependencies/ant'
require_relative 'learn_test/dependencies/imagemagick'
require_relative 'learn_test/dependencies/selenium_server'
require_relative 'learn_test/dependencies/firefox'
require_relative 'learn_test/dependencies/green_onion'

require_relative 'learn_test/strategy'
require_relative 'learn_test/strategies/jasmine'
require_relative 'learn_test/strategies/python_unittest'
require_relative 'learn_test/strategies/rspec'
require_relative 'learn_test/strategies/karma'
require_relative 'learn_test/strategies/protractor'
require_relative 'learn_test/strategies/java_junit'
require_relative 'learn_test/strategies/mocha'
require_relative 'learn_test/strategies/green_onion'
