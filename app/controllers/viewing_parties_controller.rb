class ViewingPartiesController < ApplicationController
  def new
    @movie = SearchResults.new.get_movie(params[:movie_id])
  end

  def create
    # instead, create party separately (without user id)
    # then create the join table entires with current_user, host: true
    party = Party.create(party_params)
    params[:users][:id].each do |user_id|
      UserParty.create(party_id: party.id, attendee_id: user_id)
    end
    UserParty.create(party_id: party.id, attendee_id: current_user.id, is_host: true)
    # add to Google Cal
    redirect_to '/dashboard'
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :date)
  end
end
