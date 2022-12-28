# frozen_string_literal: true

module Rdtr
  class Base
    def self.allow(*attributes)
      @@attributes = attributes.map(&:to_sym)
    end

    def initialize(params)
      @fields = params.slice(*@@attributes)
    end

    def to_h
      fields
    end

    private

    attr_reader :fields
  end
end