require 'rails_helper'

RSpec.describe "Songs Index", type: :feature do
    describe "when I visit /songs," do
        it "I see each song's title and play count" do
            carly = Artist.create!(name: "Carly Rae Jepsen")
            song_1 = Song.create!(title: "I Really Like You",
            length: 208,
            play_count: 2432154,
            artist: carly)
            song_2 = Song.create!(title: "Call Me Maybe",
            length: 199,
            play_count: 1243214,
            artist: carly)

            visit "/songs"

            expect(page).to have_content(song_1.title)
            expect(page).to have_content(song_2.title)
            expect(page).to have_content("Play count: #{song_1.play_count}")
            expect(page).to have_content("Play count: #{song_2.play_count}")
        end
    end
        # As a user
        # When I visit a Song show page
        # Then I see the song's title, length, and play count
    describe "as a user when I visit a song show page" do
        it "Then I see the song's title, length and play count" do

        end
    end
end