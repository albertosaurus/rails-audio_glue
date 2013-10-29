class HelloController < ApplicationController
  def hi
    smalltalk = params[:smalltalk]
    send_glued_audio('hi', :smalltalk => smalltalk)
  end
end
