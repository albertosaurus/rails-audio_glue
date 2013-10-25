RailsAudioGlue.setup do |config|
  begin
    require 'audio_glue/sox_adapter'
  rescue LoadError
    abort "You need to add `gem \"audio_glue-sox_adapter\"'" \
          "to your Gemfile to use AudioGlue::SoxAdapter"
  end


  # Create AudioGlue adapter and builder:
  adapter        = ::AudioGlue::SoxAdapter.new
  config.builder = ::AudioGlue::Builder.new(adapter)

  # Create template loader
  templates_path = Rails.application.root.
                         join(RailsAudioGlue::TEMPLATES_PATH).to_s
  config.loader  = ::AudioGlue::TemplateLoader.new(
                      templates_path,
                      :helper => AudioGlueHelper
                    )
end
