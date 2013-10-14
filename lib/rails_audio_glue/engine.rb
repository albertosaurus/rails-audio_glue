module RailsAudioGlue
  # :nodoc:
  class Engine < ::Rails::Engine
    initializer 'audio_glue' do

      ::ActionController::Base.class_eval do
        include RailsAudioGlue::ControllerMethods
      end

    end
  end
end
