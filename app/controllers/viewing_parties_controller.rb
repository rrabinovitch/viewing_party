class ViewingPartiesController < ApplicationController
  def new
    @movie = SearchResults.new.get_movie(params[:movie_id])
  end

  def create
    # for some reason, new party and new UserParty aren't being saved.
    party = current_user.parties.create(party_params)
    params[:users][:id].each do |user_id|
      UserParty.create(party_id: party.id, attendee_id: user_id, host_id: current_user.id)
    end
    # add to Google Cal
    redirect_to '/dashboard'
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :date)
  end
end
