require 'rest-client'
require_relative '../active_interface'
require 'json'

module Ai
  class Api < ActiveInterface
    def initialize(message, options)
      @message = message
      @options = options
    end

    def payload
      raise NotImplementedError, "The payload method must be implemented in a subclass"
    end

    def query
      raise NotImplementedError, "The connect method must be implemented in a subclass"
    end

    def api_key
      raise NotImplementedError, "The api_key method must be implemented in a subclass"
    end

    def api_url
      raise NotImplementedError, "The api_url method must be implemented in a subclass"
    end
  end
end