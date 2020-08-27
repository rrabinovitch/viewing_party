class DiscoverController < ApplicationController
  before_action :require_login

  def index
    if params[:movie_keywords].nil? == false || params[:q].nil? == false
      if params[:movie_keywords].nil? == false
        @movies = SearchResults.new.keyword_results(params[:movie_keywords])
      elsif params[:q].nil? == false
        @movies = SearchResults.new.top_forty
      end
    end
  end
end
