class GngsController < ApplicationController
  def index
  	session[:number]=rand(1..100) unless session[:number]
  end

  def submission
  	guessed = params[:guess].to_i
  	if guessed < session[:number]
  	  flash[:notice] = "Too low!"
  	  redirect_to '/'
  	elsif guessed > session[:number]
  	  flash[:notice] = "Too high!"
  	  redirect_to '/'
  	else
  	  flash[:success] = "#{session[:number]} was the number!"
      redirect_to '/'
  	end
  end

  def reset
  	reset_session
  	redirect_to '/'
  end

end
