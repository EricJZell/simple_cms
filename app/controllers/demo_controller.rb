class DemoController < ApplicationController

  def index

  end

  def hello
    @array = [1,2,3,4,5]
    @id = params[:id]
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

  def text_helpers

  end

end
