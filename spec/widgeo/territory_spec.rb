# frozen_string_literal: true

require 'spec_helper'

TERRITORY_COUNT = 254
INVALID_TERRITORY = { bad_field: 'BAD FIELD' }.freeze
TERRITORY_ALPHA = 'GB'
EU_TERRITORY_COUNT = 50
PARENT_CONTINENT_ALPHA = 'EU'

VALID_TERRITORY = {
  name: 'Beatland', long_name: 'Peoples republic of Beatland',
  alpha_2: 'BE', continent_alpha_2: 'EU'
}.freeze

TERRITORY_FIELDS = %i[name long_name alpha_2 continent_alpha_2].freeze

describe Widgeo::Territory do
  subject { Widgeo::Territory.new VALID_TERRITORY }

  it { is_expected.to respond_to(*TERRITORY_FIELDS) }

  context 'given an invalid dataset' do
    it 'raises UndefinedFieldError' do
      expect { Widgeo::Territory.new INVALID_TERRITORY }.to raise_error Widgeo::UndefinedFieldError
    end
  end

  describe '#continent' do
    subject(:continent) do
      Widgeo::Territory.find_by(:alpha_2, TERRITORY_ALPHA).continent
    end

    it { expect(continent).to be_kind_of Widgeo::Continent }
    it { expect(continent.alpha_2).to eq PARENT_CONTINENT_ALPHA }
  end

  describe '.find_by' do
    subject(:territory) { Widgeo::Territory.find_by :alpha_2, TERRITORY_ALPHA }

    it { expect(territory).to be_kind_of Widgeo::Territory }
    it { expect(territory.alpha_2).to eq TERRITORY_ALPHA }
  end

  describe '.filter_by' do
    subject(:territories) do
      Widgeo::Territory.filter_by continent_alpha_2: PARENT_CONTINENT_ALPHA
    end

    it { expect(territories).to be_kind_of Array }
    it { expect(territories.size).to be EU_TERRITORY_COUNT }
    it { expect(territories.first).to be_kind_of Widgeo::Territory }
  end

  describe '.all' do
    subject(:territories) { Widgeo::Territory.all }

    it { expect(territories).to be_a_kind_of(Array) }
    it { expect(territories.size).to be TERRITORY_COUNT }
    it { expect(territories.first).to be_kind_of Widgeo::Territory }
  end
end
