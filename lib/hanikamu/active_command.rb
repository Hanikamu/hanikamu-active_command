# frozen_string_literal: true

module Hanikamu
  # :nodoc
  class ActiveCommand < Hanikamu::Service
    include ActiveModel::Validations
    Error = Class.new(Hanikamu::Service::Error) { include ActiveModel::Validations }

    def self.call!(...)
      super
    rescue Dry::Struct::Error => e
      begin
        schema.call(...)
      rescue Dry::Types::MissingKeyError, Dry::Types::SchemaError => e
        error = self::Error.new(e.message)
        error.errors.add(e.key, I18n.t("base_command.is_missing"))
        raise error
      end
      raise e
    end

    def raise_error(errors)
      error_message = errors.is_a?(ActiveModel::Errors) ? errors.full_messages : errors
      error = Error.new(error_message)
      if errors.is_a?(ActiveModel::Errors)
        error.errors.merge!(errors)
      else
        error.errors.add(:base, errors)
      end

      raise error
    end
  end
end
