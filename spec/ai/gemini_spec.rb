require 'rspec'
require_relative '../../lib/ai/gemini'

RSpec.describe Ai::Gemini do
  let(:message) { "Hello, Gemini!" }
  let(:gemini) { Ai::Gemini.new(message) }

  before do
    ENV['AI_API_GEMINI_URL'] = 'https://api.gemini.example.com'
  end

  describe '#initialize' do
    it 'raises an error if environment variables are not set' do
      ENV.delete('AI_API_GEMINI_URL')
      expect { Ai::Gemini.new(message) }.to raise_error(RuntimeError, "AI_API_GEMINI_URL environment variables must be set")
    end

    it 'initializes with the correct message and options' do
      expect(gemini.instance_variable_get(:@message)).to eq(message)
    end
  end

  describe '#payload' do
    it 'returns the correct payload structure' do
      expected_payload = {
        contents: [
          {
            parts: [
              {
                text: message
              }
            ]
          }
        ]
      }.to_json

      expect(gemini.payload).to eq(expected_payload)
    end
  end

  describe '#query' do
    it 'sends a POST request to the API URL with the correct payload' do
      allow(RestClient).to receive(:post).and_return(double(body: '{"response": "Hello!"}'))

      response = gemini.query

      expect(response[:payload]).to eq(gemini.payload)
      expect(response[:response]).to eq('{"response": "Hello!"}')
    end

    it 'handles exceptions from RestClient' do
      allow(RestClient).to receive(:post).and_raise(RestClient::ExceptionWithResponse.new(double(code: 500, body: '{"error": "Internal Server Error"}')))

      expect { gemini.query }.to output(/Erro: 500 - {"error": "Internal Server Error"}/).to_stdout
    end
  end
end
