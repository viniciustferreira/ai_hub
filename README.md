# AiHub (WIP)

This Gem allow yo to connect to a IA chat assistent (only Gemini and Deepseek for now).

## Installation

Its time to create environment variables:
Gemini:

`AI_API_GEMINI_URL` 

obs: the key is part of the url.

Deepseek:

`AI_API_DEEPSEEK_URL` and `AI_API_DEEPSEEK_KEY` 

obs: deepseek require payment to access API for testing.

## Usage

``` require 'ai_hub'``` 

```AiHub::Query.post("Any text you want to send", 'deepseek')```

Example:

<img width="1902" height="146" alt="image" src="https://github.com/user-attachments/assets/cacfea92-dcb7-42c7-8183-82d4a634ca82" />


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/viniciustferreira/ai_hub.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
