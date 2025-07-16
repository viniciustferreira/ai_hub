# The deepseek API client is not free, as long as i know so far.

require_relative 'api'

module Ai
  class Deepseek < Ai::Api
    def initialize(message, options)
      raise "AI_API_DEEPSEEK_URL and AI_API_DEEPSEEK_KEY environment variables must be set" unless ENV['AI_API_DEEPSEEK_URL'] && ENV['AI_API_DEEPSEEK_KEY']

      @model = options[:model] || 'deepseek-chat'
      @stream = options[:stream] || false
      super(message, options)
    end

    def query
      response = RestClient.post api_url, payload, { content_type: "application/json", authorization: "Bearer #{api_key}" }
      { payload: payload, response: response.body } 

      rescue RestClient::ExceptionWithResponse => e
        puts "Erro: #{e.response.code} - #{e.response.body}"
    end

    def payload
      {
        model: @model,
        messages: [
          { role: "system", "content": @message }
        ],
        stream: @stream
      }.to_json
    end

    def api_url
      ENV['AI_API_DEEPSEEK_URL']
    end

    def api_key
      ENV['AI_API_DEEPSEEK_KEY']
    end
  end
end