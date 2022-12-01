require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: "Prince")
    @purple = @prince.songs.create!(title: "Purple Rain", length: 321, play_count:3214)
    @beret = @prince.songs.create!(title: "Raspberry Beret", length: 313, play_count:23214)
    @other_song = @prince.songs.create!(title: "Other Song", length: 1, play_count:23214)

  end

  it 'shows all the song titles for the artists' do

    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@purple.title)
  end

  it 'it links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average song length for Prince: 211.67")
  end
end