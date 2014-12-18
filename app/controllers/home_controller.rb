class HomeController < ActionController::Base
  protect_from_forgery

  def index

  end

  def submit_request
    ContactMailer.notify(params[:email], params[:name], params[:contact_number], params[:message])
    redirect_to root_url, { :notice => "Thanks for contacting me! I'll be in touch shortly!" }
  end

end
