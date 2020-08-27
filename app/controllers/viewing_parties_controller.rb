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

    calendar = Google::Apis::CalendarV3
    client = calendar::CalendarService.new

    client.authorization = google_secret.to_authorization

    event = Google::Apis::CalendarV3::Event.new(
      summary: "#{party.movie} Viewing Party",
      start: Google::Apis::CalendarV3::EventDateTime.new(
        date: params[:date]
      ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
        date: params[:date] # fix end time to reflect duration
      )
    )

    result = client.insert_event('primary', event)

    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :date, :time)
  end

  # def create_google_cal_event ## to refactor out of #create action
  # end

  def google_secret
    Google::APIClient::ClientSecrets.new(
      { "web" =>
        { "access_token" => current_user.token,
          "refresh_token" => current_user.refresh_token,
          "client_id" => ENV['GOOGLE_CLIENT_ID'],
          "client_secret" => ENV['GOOGLE_CLIENT_SECRET']
        }
      }
    )
  end
end
