require 'spec_helper'

describe "Filtering movies" do

  it "shows hit movies" do
    movie = Movie.create!(movie_attributes(released_on: 1.day.ago, total_gross: 300_000_000))

    visit movies_url

    click_link "Hits"

    expect(current_path).to eq("/movies/filter/hits")

    expect(page).to have_text(movie.title)
  end

  it "shows flop movies" do
    movie = Movie.create!(movie_attributes(released_on: 1.day.ago, total_gross: 49_000_000))

    visit movies_url

    click_link "Flops"

    expect(current_path).to eq("/movies/filter/flops")

    expect(page).to have_text(movie.title)
  end

  it "shows upcoming movies" do
    movie = Movie.create!(movie_attributes(released_on: 1.day.from_now))

    visit movies_url

    click_link "Upcoming"

    expect(current_path).to eq("/movies/filter/upcoming")

    expect(page).to have_text(movie.title)
  end

  it "shows recent movies" do
    movie = Movie.create!(movie_attributes(released_on: 1.day.ago))

    visit movies_url

    click_link "Recent"

    expect(current_path).to eq("/movies/filter/recent")

    expect(page).to have_text(movie.title)
  end
end

#Create a new feature spec file called filter_movies_spec.rb. Then, for each scenario above, add a code example that clicks the appropriate link and makes expectations about the resulting URL path and page contents. Given all the other specs you have, for these scenarios it's sufficient just to test with a single movie and expect to see its title on the resulting page.