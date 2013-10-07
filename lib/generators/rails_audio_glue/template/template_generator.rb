module RailsAudioGlue
  module Generators
    class TemplateGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      argument :template_name, :type => :string

      def create_template
        template 'template.glue.erb', "#{RailsAudioGlue::TEMPLATES_PATH}/#{template_name}.glue"
      end

    end
  end
end
