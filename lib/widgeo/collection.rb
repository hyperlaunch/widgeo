# frozen_string_literal: true

module Widgeo
  # Methods for working with collection of entities
  module Collection
    # Set/Get the dataset file name
    def dataset_file(file_name = nil)
      @dataset_file ||= file_name
    end

    # Return the dataset
    def dataset
      # Raise an exception if the dataset file has not been set on the class
      raise UndefinedDatasetError unless dataset_file

      @dataset ||= YAML.load_file(
        File.join(File.dirname(__FILE__), '../', 'data', "#{dataset_file}.yml")
      )
    end

    # Does the item match the requested attributes?
    def matches?(item, attributes)
      attributes.map do |attribute, value|
        item.send(attribute) == value
      end.flatten == [true]
    end

    # Filter the items by a combination of values
    def filter_by(attributes)
      all.select { |item| matches? item, attributes }
    end

    # Find an item by an attribute
    def find_by(attribute, value)
      all.detect { |continent| continent.send(attribute) == value }
    end

    # Parse full list and memoize it
    def all
      @all ||= dataset.map { |item| new item }
    end
  end
end
