RSpec.describe 'As an authenticated user' do
  before :each do
    @current_user = User.create(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')
    @movie_id = 13778

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe 'New viewing party form' do
    it 'With friends: When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        friend1 = User.create(user_id: '9999', username: 'ruthie@gmail.com', token: '4321ruthie', refresh_token: 'ruthie4321')
        friend2 = User.create(user_id: '1111', username: 'noodle@gmail.com', token: '1234noodle', refresh_token: 'noodle4321')
        @current_user.friends << friend1
        @current_user.friends << friend2

        visit viewing_parties_new_path({movie_id: @movie_id})

        expect(page).to have_css(".movie-title")
        expect(page).to have_selector("#duration")
        expect(page).to have_selector("#date")
        expect(page).to have_content("Invite friends to your viewing party:")
        expect(page).to have_css(".friends")
        expect(page).to have_content(friend1.username)
        expect(page).to have_content(friend2.username)

        expect(page).to have_button("Create Party")
      end
    end

    it 'Without friends: When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        visit viewing_parties_new_path({movie_id: @movie_id})

        expect(page).to have_css(".movie-title")
        expect(page).to have_selector("#duration")
        expect(page).to have_selector("#date")
        expect(page).to have_content("Invite friends to your viewing party:")
        # expect(page).to_not have_selector("#friend_ids")
        expect(page).to have_content("No friends to invite to your viewing party.")

        expect(page).to have_button("Create Party")
      end
    end
  end

  describe 'Filling out new viewing party form' do
    xit "I can create a new viewing party and invite friends, and my new viewing party is shown on my and my friends' dashboards" do
      VCR.use_cassette('find_dickie_roberts_by_id', :allow_playback_repeats => true) do
        friend1 = User.create(user_id: '9999', username: 'ruthie@gmail.com', token: '4321ruthie', refresh_token: 'ruthie4321')
        friend2 = User.create(user_id: '1111', username: 'noodle@gmail.com', token: '1234noodle', refresh_token: 'noodle4321')
        @current_user.friends << friend1
        @current_user.friends << friend2

        visit viewing_parties_new_path({movie_id: @movie_id})

        fill_in :duration, with: 200
        fill_in :date, with: '2020/09/01'
        fill_in :time, with: '08:00 PM'
        within('.friends') do
          page.check('ruthie@gmail.com')
          page.check('noodle@gmail.com')
        end
        click_button("Create Party")

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Dickie Roberts: Former Child Star")
        # figure out how to make test less brittle
        # add additional expectations re: date and time for dashboard view of a party

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(friend1)
        visit dashboard_path
        expect(page).to have_content("Viewing party created for Dickie Roberts: Former Child Star on 2020/09/01")
        expect(page).to have_content("Dickie Roberts: Former Child Star")
        # expect(page).to have_button("Add to Calendar")
      end
    end
  end
end
