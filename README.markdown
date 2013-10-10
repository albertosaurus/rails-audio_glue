# Rails AudioGlue

A Rails plugin which integrates AudioGlue - a library used to assemble audio
from snippets using templates.

## Usage

### Install

After adding `gem 'rails-audio_glue'` to `Gemfile` and running `bundle`,
run the generator to install the basic stuff:

```sh
rails g rails_audio_glue:install

    create  config/initializers/audio_glue.rb
    create  app/audio_templates/audio_glue_helper.rb
```

### Audio templates

Now generate your first audio template:

```sh
rails g rails_audio_glue:template hello_world

    create  app/audio_templates/hello_world.glue
```

To get more info about `.glue` templates read
[AudioGlue's README](https://github.com/TMXCredit/audio_glue/).

Ensure you have the following `hello_world.glue` in `app/audio_templates`:

```ruby
head {
  format :mp3
  rate 44100
  channels 1
}

body {
  - file("/path/to/audio/hello.wav")
  if @say_bye
    - url("http://some-server.com/say/bye.mp3")
  end
}
```

The output file parameters are described in the `head` section. And
the content is described in the `body` section. It's all pure ruby code.

### Sending audio from controller

To build an audio file using a template and send it to a user, use the
`send_glued_audio` controller method. It receives a template name and template
variables as arguments and is built upon the `send_data` method:

```ruby
class HelloController < ApplicationController
  # Convert hello.wav to mp3 and send it as hello_world.mp3:
  def hi
    send_glued_audio('hello_world', :say_bye => false)
  end

  # Concatenate hello.wav and bye.mp3, convert to mp3, and send
  # as hello_world.mp3:
  def hi_and_bye
    send_glued_audio('hello_world', :say_bye => true)
  end
end
```

### Using helpers

To extend the `body` template section with custom methods, you need
to define them in `AudioGlueHelper`. Usually, they are supposed to based
upon the `file` and `url` methods.

```ruby
module AudioGlueHelper
  # The some-speaking-service is supposed to return audio file:
  def say(text)
    url("http://some-speaking-service.com/say/#{text}")
  end
end
```

Now you can use the `say` method in the `body` template section:

```ruby
body {
  - file("/path/to/audio/hello.wav")
  - say("What's up?")
}
```


## Testing

### Requirements

You must have the `sqlite3` package installed.

### Running the Tests

```sh
  bundle
  cd spec/dummy
  rake db:setup db:migrate
  cd -
  rake spec
```

## Credits

* [Sergey Potapov](https://github.com/greyblake)

## Copyright

Copyright (c) 2013 TMX Credit.
