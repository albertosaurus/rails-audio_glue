module RailsAudioGlue
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_initializer_file
        template 'initializer.rb.erb', 'config/initializers/audio_glue.rb'
      end

      def create_audio_glue_helper
        template 'audio_glue_helper.rb.erb', "#{RailsAudioGlue::TEMPLATES_PATH}/audio_glue_helper.rb"
      end

    end
  end
end
