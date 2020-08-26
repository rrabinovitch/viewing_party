require 'google/api_client/client_secrets.rb'
require 'google/apis/calendar_v3'

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

  def google_secret
    Google::APIClient::ClientSecrets.new(
      { 'web' =>
        { 'access_token' => @user.google_token,
          'refresh_token' => @user.google_refresh_token,
          'client_id' => Rails.application.secrets.google_client_id,
          'client_secret' => Rails.application.secrets.google_client_secret } }
    )
  end
end
