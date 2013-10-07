require 'rails_audio_glue/controller_methods'
require 'rails_audio_glue/engine'

# Rails plugin which integrates AudioGlue library.
module RailsAudioGlue
  # Path to directory where audio templates are supposed to be located.
  TEMPLATES_PATH = 'app/audio_templates'

  # Instance of AuduoGlue::Builder
  mattr_accessor :builder

  # Instance of AuduoGlue::TemplateLoader
  mattr_accessor :loader

  # should be called from initializer to configure RailsAudioGlue
  def self.setup
    yield self
  end
end
