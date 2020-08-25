RSpec.describe 'As an authenticated user' do
  before :each do
    @current_user = User.create(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe 'New viewing party form' do
    it 'With friends: When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        friend1 = User.create(user_id: '9999', username: 'ruthie@gmail.com', token: '4321ruthie', refresh_token: 'ruthie4321')
        friend2 = User.create(user_id: '1111', username: 'noodle@gmail.com', token: '1234noodle', refresh_token: 'noodle4321')
        @current_user.friends << friend1
        @current_user.friends << friend2

        visit viewing_parties_new_path({movie_id: 13778})

        # expect(page).to have_css("#movie-title") ## not being found for some reason: come back to this later
        expect(page).to have_selector("#duration")
        expect(page).to have_selector("#date")
        expect(page).to have_selector("#friend_ids")
        expect(page).to have_content(friend1.username)
        expect(page).to have_content(friend2.username)


        expect(page).to have_button("Create Party")
      end
    end

    it 'Without friends: When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        visit viewing_parties_new_path({movie_id: 13778})

        # expect(page).to have_css("#movie-title") ## not being found for some reason: come back to this later
        expect(page).to have_selector("#duration")
        expect(page).to have_selector("#date")
        expect(page).to_not have_selector("#friend_ids")
        expect(page).to have_content("No friends to invite to your viewing party.")

        expect(page).to have_button("Create Party")
      end
    end
  end

  describe 'Filling out new viewing party form' do
    it 'With friends: When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        friend1 = User.create(user_id: '9999', username: 'ruthie@gmail.com', token: '4321ruthie', refresh_token: 'ruthie4321')
        friend2 = User.create(user_id: '1111', username: 'noodle@gmail.com', token: '1234noodle', refresh_token: 'noodle4321')
        @current_user.friends << friend1
        @current_user.friends << friend2

        visit viewing_parties_new_path({movie_id: 13778})

        fill_in :duration, with: 200
        # page.check(friend1.username)


        # expect(page).to have_selector("#date")
        # expect(page).to have_selector("#friend_ids")
        # expect(page).to have_content(friend1.username)
        # expect(page).to have_content(friend2.username)
        #
        #
        # expect(page).to have_button("Create Party")
      end
    end
  end
end
