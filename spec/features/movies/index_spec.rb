# movies/index_spec.rb
RSpec.describe 'As an authenticated user' do
  before :each do

    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit discover_path
  end

  it 'When I visit the movies page, I should see the 40 results from my search, I should also see the "Find Top Rated Movies" button and the Find Movies form at the top of the page.' do

    click_on "Find Top Rated Movies"
    expect(current_path).to eq(movies_path)

    expect(page).to have_selector("#movie_keywords")
    expect(page).to have_button("Find Movies")

    within(".top40") do
      expect(page).to have_selector(".movie-title", count: 40)
    end

    # test mock results for top 40 search
  end

  it 'When I click on a movie title link, I should be redirected to the movie\'s details page' do

    click_on "Find Top Rated Movies"
    expect(current_path).to eq(movies_path)

    find('.movie-title', match: :first).click
    expect(current_path).to eq(movies_detail_path)
  end
end
