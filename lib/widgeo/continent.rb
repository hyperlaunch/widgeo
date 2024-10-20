# frozen_string_literal: true

module Widgeo
  # Working with continents
  class Continent
    extend Widgeo::Collection
    include Widgeo::Model

    attr_reader :name, :alpha_2

    dataset_file :continents
  end
end
