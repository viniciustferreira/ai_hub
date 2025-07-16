require_relative 'api'

module Ai
  class Gemini < Ai::Api
    def initialize(message, options = {})
      raise "AI_API_GEMINI_URL and AI_API_GEMINI_KEY environment variables must be set" unless ENV['AI_API_GEMINI_URL'] && ENV['AI_API_GEMINI_KEY']
      super(message, options)
    end

    def query
      response = RestClient.post api_url, payload, { content_type: "application/json" }
      { payload: payload, response: response.body } 

      rescue RestClient::ExceptionWithResponse => e      
        puts "Erro: #{e.response.code} - #{e.response.body}" 
    end

    def payload
      {
        contents: [
          {
            parts: [
              {
                text: @message
              }
            ]
          }
        ]
      }.to_json
    end

    def api_url
      ENV['AI_API_GEMINI_URL']
    end

    def api_key
      ENV['AI_API_GEMINI_KEY']
    end
  end
end