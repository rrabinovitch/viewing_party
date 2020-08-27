class GoogleCalService
  def create_event(current_user, party_params)
    calendar = Google::Apis::CalendarV3
    client = calendar::CalendarService.new

    client.authorization = google_secret(current_user).to_authorization

    event = Google::Apis::CalendarV3::Event.new(
      summary: "#{party_params.movie} Viewing Party",
      start: Google::Apis::CalendarV3::EventDateTime.new(
        date: party_params.date
      ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
        date: party_params.date
      )
    )

    client.insert_event('primary', event)
  end

  private

  def google_secret(current_user)
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
