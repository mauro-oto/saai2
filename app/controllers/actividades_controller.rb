class ActividadesController < ApplicationController
  require 'youtube_it'

  def index
  end

  def video
  	@videoid = params[:videoid]
  end

  def videolist
  	client = YouTubeIt::Client.new
  	if !(params[:cantidad])
  		@maxresults = 3
  	else
  	    @maxresults = params[:cantidad]
  	end
  	reply = client.videos_by(:query => "aprender ingles en español", :max_results => @maxresults, :restriction => 'ES', :fields => {:view_count => "5000"} )
  	@videos = reply.videos
  end
end
