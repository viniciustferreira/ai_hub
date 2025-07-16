# frozen_string_literal: true

require_relative "ai_hub/version"
require_relative "ai/gemini"
require_relative "ai/deepseek"

module AiHub
  class Error < StandardError; end

  class Query 
    def self.post(message, kind, options = {})
      api = Kernel.const_get("Ai::#{kind.to_s.capitalize}")
      api.new(message, options).query
    end
  end
end
