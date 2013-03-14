class ApplicationController < ActionController::Base

  def index
    render :text => 'Rendered MiniTest::Spec', :layout => false
  end

end
