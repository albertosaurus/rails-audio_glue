require 'spec_helper'

describe RailsAudioGlue do
  it { should respond_to :setup }

  it { should respond_to :builder  }
  it { should respond_to :builder= }

  it { should respond_to :loader  }
  it { should respond_to :loader= }
end
