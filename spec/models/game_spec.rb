require 'spec_helper'

describe Game do
  it { should respond_to(:title) }
  it { should respond_to(:remote_cover) }
  it { should respond_to(:rate) }
  it { should respond_to(:review) }
  it { should respond_to(:state) }
  it { should respond_to(:total_sessions) }
  it { should respond_to(:started_on) }
  it { should respond_to(:finished_on) }
  it { should respond_to(:url) }
  it { should respond_to(:blurb) }
  it { should respond_to(:forum_url) }
  it { should respond_to(:total_days_played) }
  it { should respond_to(:favorite) }

  context 'when validating' do
    it 'is invalid without a title' do
      game = build(:game, title: nil)
      game.should_not be_valid
      game.should have(1).error_on(:title)
    end

    it 'is invalid without a url' do
      game = build(:game, url: nil)
      game.should_not be_valid
      game.should have(1).error_on(:url)
    end

    it 'is invalid without a forum_url' do
      game = build(:game, forum_url: nil)
      game.should_not be_valid
      game.should have(1).error_on(:forum_url)
    end

    it 'is invalid without a remote_cover' do
      game = build(:game, remote_cover: nil)
      game.should_not be_valid
      game.should have(1).error_on(:remote_cover)
    end
  end

  context "methods" do
    describe "#total_days_taken" do
      it "is 0 if finished_on or started_on is nil" do
        game = build(:game, finished_on: nil, started_on: nil)
        expect(game.total_days_taken).to eq(1)
      end

      it "has ten days passed after started the game" do
        #it is 9 because the started day counts
        game = build(:game, finished_on: Date.today, started_on: Date.today-9)
        expect(game.total_days_taken).to eq(10)
      end
    end

    describe "#total_days_in_this_session" do
      it "has ten days of playing this game" do
        game = build(:game, started_on: Date.today-9)
        expect(game.total_days_in_this_session).to eq(10)
      end
    end
  end
end
