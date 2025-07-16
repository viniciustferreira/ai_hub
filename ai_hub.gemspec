# frozen_string_literal: true

require_relative "lib/ai_hub/version"
require_relative "lib/active_interface"
require_relative "lib/ai/api"
require_relative "lib/ai/gemini"
require_relative "lib/ai/deepseek"

Gem::Specification.new do |spec|
  spec.name = "ai_hub"
  spec.version = AiHub::VERSION
  spec.authors = ["vinicius ferreira"]
  spec.email = ["viniciustferreira@gmail.com"]

  spec.summary = "Create a gem that provides a hub for AI-related functionalities."
  spec.description = "This gem serves as a hub for various AI-related functionalities, allowing users to easily integrate and utilize AI capabilities in their Ruby applications."
  spec.homepage = "http://example.com/ai_hub"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://ai-hub.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yourusername/ai_hub"
  spec.metadata["changelog_uri"] = "https://github.com/yourusername/ai_hub/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir.glob("lib/**/*").select { |f| File.file?(f) } + [gemspec]
  spec.executables = ['ai_hub']
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
