# frozen_string_literal: true

require 'widgeo/version'
require 'widgeo/collection'
require 'widgeo/model'
require 'widgeo/continent'
require 'widgeo/territory'

# Provides territory and continent utilities for ruby
module Widgeo
  require 'yaml'

  class UndefinedDatasetError < StandardError; end
  class UndefinedFieldError < StandardError; end
end
