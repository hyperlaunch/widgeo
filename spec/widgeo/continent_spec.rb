# frozen_string_literal: true

require 'spec_helper'

CONTINENT_COUNT = 7
INVALID_CONTINENT = { bad_field: 'BAD FIELD' }.freeze
CONTINENT_ALPHA = 'EU'
VALID_CONTINENT = { name: 'Beatland', alpha_2: 'BE' }.freeze
CONTINENT_FIELDS = %i[name alpha_2].freeze

describe Widgeo::Continent do
  subject { Widgeo::Continent.new VALID_CONTINENT }

  it { is_expected.to respond_to(*CONTINENT_FIELDS) }

  context 'given an invalid dataset' do
    it 'raises UndefinedFieldError' do
      expect { Widgeo::Continent.new INVALID_CONTINENT }.to raise_error Widgeo::UndefinedFieldError
    end
  end

  describe '.find_by' do
    subject(:continent) { Widgeo::Continent.find_by :alpha_2, CONTINENT_ALPHA }

    it { expect(continent).to be_kind_of Widgeo::Continent }
    it { expect(continent.alpha_2).to eq CONTINENT_ALPHA }
  end

  describe '.all' do
    subject(:continents) { Widgeo::Continent.all }

    it { expect(continents).to be_kind_of Array }
    it { expect(continents.size).to be CONTINENT_COUNT }
    it { expect(continents.first).to be_kind_of Widgeo::Continent }
  end
end
