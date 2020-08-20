RSpec.describe 'As an authenticated user' do
  before :each do
    visit root_path
    click_on "Login"
  end

  it 'I should see a button to discover top-rated movies' do
    #
    visit discover_path
    expect(page).to have_button("Find Top Rated Movies")
  end

  it 'I should also see a text field to enter a keyword(s) in the movie title and a "Find Movies" button' do
    #
    visit discover_path
    expect(page).to have_selector("#movie_keywords")
    expect(page).to have_button("Find Movies")
  end
end
