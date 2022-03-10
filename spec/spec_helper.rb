# frozen_string_literal: true

require 'bundler/setup'

require 'rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.order = :random
end
