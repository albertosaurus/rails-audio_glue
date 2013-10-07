module RailsAudioGlue
  # Provides +send_glued_audio+ method for ApplicationController.
  module ControllerMethods
    # Mapper for audio formats and mime types. If format is unknown it will be
    # generating dynamically using proc.
    GLUE_MIME_TYPES = {
      :mp3   => 'audio/mpeg',
      :m4a   => 'audio/mp4',
      :ogg   => 'audio/ogg',
      :oga   => 'audio/ogg',
      :webma => 'audio/webm',
      :wav   => 'audio/wav',
    }
    GLUE_MIME_TYPES.default_proc = lambda { |hash, key| "audio/#{key}"}

    # Assemble audio using according to the passed template and variables and
    # send it as data.
    #
    # @param template_name [String] name of template in app/audio_templates
    # @param variables [Hash] instance variables to initiate template.
    #
    # @return [void]
    def send_glued_audio(template_name, variables = {})
      # Reset cache in development so we don't need to restart server to see
      # changes in glue template.
      RailsAudioGlue.loader.reset_cache! if Rails.application.development?

      template = RailsAudioGlue.loader.get(template_name).new(variables)
      data = RailsAudioGlue.builder.build(template)

      filename = "#{File.basename(template_name)}.#{template.format}"
      mime_type = GLUE_MIME_TYPES[template.format]

      send_data(data, :filename => filename, :type => mime_type)
    end
  end
end
