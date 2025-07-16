require 'rspec'
require_relative '../../lib/ai/deepseek'

RSpec.describe Ai::Deepseek do
  let(:message) { "Hello, Deepseek!" }
  let(:options) { { model: 'deepseek-1.0' } }
  let(:deepseek) { Ai::Deepseek.new(message, options) }

  before do
    ENV['AI_API_DEEPSEEK_URL'] = 'https://api.deepseek.example.com'
    ENV['AI_API_DEEPSEEK_KEY'] = 'test_api_key'
  end

  describe '#initialize' do
    it 'raises an error if environment variables are not set' do
      ENV.delete('AI_API_DEEPSEEK_URL')
      expect { Ai::Deepseek.new(message, options) }.to raise_error(RuntimeError, "AI_API_DEEPSEEK_URL and AI_API_DEEPSEEK_KEY environment variables must be set")
    end

    it 'initializes with the correct message and options' do
      expect(deepseek.instance_variable_get(:@message)).to eq(message)
      expect(deepseek.instance_variable_get(:@options)).to eq(options)
    end
  end

  describe '#payload' do
    it 'returns the correct payload structure' do
      expected_payload = {
        model: 'deepseek-1.0',
        messages: [
          { role: "system", "content": message }
        ],
        stream: false
      }.to_json

      expect(deepseek.payload).to eq(expected_payload)
    end
  end

  describe '#query' do
    it 'sends a POST request to the API URL with the correct payload' do
      allow(RestClient).to receive(:post).and_return(double(body: '{"response": "Hello!"}'))

      response = deepseek.query

      expect(response[:payload]).to eq(deepseek.payload)
      expect(response[:response]).to eq('{"response": "Hello!"}')
    end

    it 'handles exceptions from RestClient' do
      allow(RestClient).to receive(:post).and_raise(RestClient::ExceptionWithResponse.new(double(code: 500, body: '{"error": "Internal Server Error"}')))

      expect { deepseek.query }.to output(/Erro: 500 - {"error": "Internal Server Error"}/).to_stdout
    end
  end
end