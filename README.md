# Viewing Party

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and their friends. Users access the site via Google OAuth, which also allows them to add viewing party events to their Google Calendar. Users may add friends to their account by searching GMail account names that are associated with other existing application accounts. [TMDB API](https://www.themoviedb.org/) is used to access movie info via a "40 Top Rated" search and a keyword search.

### Team & Reflections
* [Gaby Mendez](https://github.com/gabichuelas)
* [Ruthie Rabinovitch](https://github.com/rrabinovitch)

The main learnings from this project came from learning, managing, and integrating several new technologies and concepts at once, while keeping OOP principles top of mind: Travis CI's integration with Heroku, API consumption and refactoring, new types of mocks and and stubs, OAuth and scopes, RuboCop's style guide, etc. There is still much learning to be done in order to reach deeper levels of understanding and comfort with all of these technologies and concepts in conjunction with each other, but we feel excited about how much we've learned in the course of the ten quick days during which we executed this project.

### Local Setup

1. Fork and Clone the repo
2. Obtain API key from [TMDB](https://developers.themoviedb.org/3/getting-started/introduction)
3. Obtain Google OAuth credentials and set up Google Calendar API scope (you may reference [this Medium article](https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35) and the [OmniAuth documentation](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview) for set up support)
4. Install gem packages: `bundle install`
5. Setup the database: `rails db:create`
6. Run your local server: `rails s` and visit http://localhost:300
7. Run test suite: `bundle exec rspec`


### Languages, Frameworks, and Technologies

- Ruby 2.5.3
- Rails 5.2.4.3
- TMDB API
- PostgreSQL
- TravisCI
- Heroku

### ERD
![ERD](https://user-images.githubusercontent.com/62635544/91383174-ba2a8880-e7e8-11ea-83ba-e056218b16a2.png)
