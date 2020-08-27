class DiscoverController < ApplicationController
  before_action :require_login

  def index
    if params[:movie_keywords]
      @movies = SearchResults.new.keyword_results(params[:movie_keywords])
    elsif params[:q]
      @movies = SearchResults.new.top_forty
    end
  end
end
