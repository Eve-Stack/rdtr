# frozen_string_literal: true

class Person < Rdtr::Base
  allow :name, :age
end

RSpec.describe Rdtr::Base do
  describe 'to_h contains only allowed attributes' do
    let(:params) { { name: 'John', age: 30, weight: 120 } }
    let(:person) { Person.new(params) }

    subject { person.to_h }


    it 'allows to initialize with allowed' do
      is_expected.to include(:name, :age)
      is_expected.not_to include(:weight)
    end
  end
end
