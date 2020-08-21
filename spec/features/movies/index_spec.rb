# movies/index_spec.rb
RSpec.describe 'As an authenticated user' do
  before :each do
    visit root_path
    click_on "Login"
  end

  it 'When I visit the movies page, I should see the 40 results from my search, I should also see the "Find Top Rated Movies" button and the Find Movies form at the top of the page.' do

    visit discover_path
    click_on "Find Top Rated Movies"
    expect(current_path).to eq(movies_path)

    expect(page).to have_selector("#movie_keywords")
    expect(page).to have_button("Find Movies")

    within(".top40") do
      expect(page).to have_selector(".movie-title", count: 40)
    end
  end
end
