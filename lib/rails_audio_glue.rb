require 'rails_audio_glue/engine'

module RailsAudioGlue

  # Instance of AuduoGlue::Builder
  mattr_accessor :builder

  # Instance of AuduoGlue::TemplateLoader
  mattr_accessor :loader


  # should be called from initializer to configure RailsAudioGlue
  def self.setup
    yield self
  end


  def self.build(template_name, variables = {})
    template = self.template_loader.get(template_name)
    self.builder.build(template)
  end
end
