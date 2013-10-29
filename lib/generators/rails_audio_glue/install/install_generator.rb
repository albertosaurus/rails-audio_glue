module RailsAudioGlue
  # :nodoc:
  module Generators
    # :nodoc:
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      # :nodoc:
      def create_initializer_file
        template 'initializer.rb.erb', 'config/initializers/audio_glue.rb'
      end

      # :nodoc:
      def create_audio_glue_helper
        template 'audio_glue_helper.rb.erb',
                 "#{RailsAudioGlue::TEMPLATES_PATH}/audio_glue_helper.rb"
      end

    end
  end
end
