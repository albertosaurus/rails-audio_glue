require 'spec_helper'

describe HelloController do
  let(:audio) { double(:audio_data) }

  it 'should build audio' do
    RailsAudioGlue.builder.should_receive(:build) do |template|
      template.should be_a(AudioGlue::Template)
      template.path.should =~ /hi\.glue$/
      template.instance_variable_get('@smalltalk').should == true
    end.and_return(audio)

    controller.should_receive(:send_data).
      with(audio, :filename => 'hi.mp3', :type => 'audio/mpeg')

    get :hi, :smalltalk => true
  end
end
