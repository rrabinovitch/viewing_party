RSpec.describe 'As an authenticated user, when I visit the discover page' do
  before :each do
    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit discover_path
  end

  it 'I should see a button to discover top-rated movies; when I click on it, I\'m taken to the Movies page' do

    click_on "Find Top Rated Movies"
    expect(current_path).to eq(movies_path)
  end

  it 'I should also see a text field to enter a keyword(s) in the movie title and a "Find Movies" button' do

    expect(page).to have_selector("#movie_keywords")
    expect(page).to have_button("Find Movies")
  end

  it "when I submit a movie keyword(s) search, I am taken to the movies page" do
    fill_in :movie_keywords, with: "Dickie Roberts"
    click_on "Find Movies"
    expect(current_path).to eq(movies_path)
  end
end
