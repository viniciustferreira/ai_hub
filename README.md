# AiHub (WIP)

This Gem allow yo to connect to a IA chat assistent (Gemini and Deepseek).

## Installation

This is not available on rubygems, its necessary to download this package and install with: `gem build ai_hub.gemspec && gem install ai_hub-0.1.0.gem` .

After installing, its time to create the `.secrets` file on your rails project, running the `ai_hub_init` on console command on the root folder, filling the file with the kash keys and urls, and then running again to create the env variables with the data.

## Usage

``` require 'ai_hub'``` 

```AiHub::Query.post("Any text you want to send", 'deepseek')```

Example:

<img width="1902" height="146" alt="image" src="https://github.com/user-attachments/assets/cacfea92-dcb7-42c7-8183-82d4a634ca82" />


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/viniciustferreira/ai_hub.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
