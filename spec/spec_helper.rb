require 'bundler/setup'
Bundler.setup

require 'jr'

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed
end
