require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe "instance methods" do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: "Prince")
        @purple = @prince.songs.create!(title: "Purple Rain", length: 321, play_count:3214)
        @beret = @prince.songs.create!(title: "Raspberry Beret", length: 313, play_count:23214)
        @other_song = @prince.songs.create!(title: "Other Song", length: 1, play_count:23214)
      end
      it 'returns the average song length' do
        expect(@prince.average_song_length.to_f).to eq(211.67)
      end
    end
  end
end