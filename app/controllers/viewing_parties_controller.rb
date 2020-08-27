require 'google/api_client/client_secrets.rb'
require 'google/apis/calendar_v3'

class ViewingPartiesController < ApplicationController
  def new
    @movie = SearchResults.new.get_movie(params[:movie_id])
  end

  def create
    party = Party.create(party_params)
    friends = params[:users][:id] unless params[:users].nil?
    unless friends.nil?
      friends.each do |user_id|
        UserParty.create(party_id: party.id, attendee_id: user_id)
      end
    end

    UserParty.create(party_id: party.id, attendee_id: current_user.id, is_host: true)

    if party.save
      GoogleCalService.new.create_event(current_user, party)
      redirect_to dashboard_path
      flash[:success] = "Viewing party created for #{party.movie} on #{party.date}"
    else
      render :new
      flash[:error] = party.errors.full_messages.to_sentence
    end
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :date, :time)
  end
end
