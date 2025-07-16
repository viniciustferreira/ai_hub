# frozen_string_literal: true

RSpec.describe AiHub do
  it "has a version number" do
    expect(AiHub::VERSION).not_to be nil
  end

  describe ".post" do
    let(:message) { "Hello, AI!" }
    let(:options) { { additional: "data" } }

    before do
      allow(RestClient).to receive(:post).and_return(double(body: '{"response": "Hello!"}'))
    end

    context "when using Gemini API" do
      it "returns a response from Gemini" do
        response = AiHub::Query.post(message, :gemini, options)
        expect(response).to be_a(Hash) # Adjust based on actual response type
      end
    end

    context "when using Deepseek API" do
      it "returns a response from Deepseek" do
        response = AiHub::Query.post(message, :deepseek, options)
        expect(response).to be_a(Hash) # Adjust based on actual response type
      end
    end
  end
end
