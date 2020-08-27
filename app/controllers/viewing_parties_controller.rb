require 'google/api_client/client_secrets.rb'
require 'google/apis/calendar_v3'

class ViewingPartiesController < ApplicationController
  def new
    @movie = SearchResults.new.get_movie(params[:movie_id])
  end

  def create
    binding.pry
    # instead, create party separately (without user id)
    # then create the join table entires with current_user, host: true
    party = Party.create(party_params)
    friends = params[:users][:id]
    unless friends.nil?
      friends.each do |user_id|
        UserParty.create(party_id: party.id, attendee_id: user_id)
      end
    end
    UserParty.create(party_id: party.id, attendee_id: current_user.id, is_host: true)
    create_google_calendar_event(party.movie)
    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :date, :time)
  end

  def create_google_calendar_event(movie_title) #add , start_datetime, end_datetime args
    event = Google::Apis::CalendarV3::Event.new({
      summary: "#{movie_title} Watch Party",
      start: Google::Apis::CalendarV3::EventDateTime.new(
        date_time: '2015-05-28T09:00:00-07:00',
        time_zone: 'America/Los_Angeles'
        ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
        date_time: '2015-05-28T17:00:00-07:00',
        time_zone: 'America/Los_Angeles'
        )
      })

  end



  # def google_secret
  #   Google::APIClient::ClientSecrets.new(
  #     { 'web' =>
  #       { 'access_token' => @user.google_token,
  #         'refresh_token' => @user.google_refresh_token,
  #         'client_id' => Rails.application.secrets.google_client_id,
  #         'client_secret' => Rails.application.secrets.google_client_secret } }
  #   )
  # end
end
