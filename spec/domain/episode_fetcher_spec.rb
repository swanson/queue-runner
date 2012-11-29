require "spec_helper"
require "pry"

describe EpisodeFetcher do
  before(:each) do
    @api = stub
    @fetcher = EpisodeFetcher.new(@api)
  end

  context "#add_new_episodes" do
    let(:s01e01) { {"season" => "1", "episode" => "1", "title" => "Pilot", "first_aired" => 2.weeks.ago.to_i} }
    let(:s01e02) { {"season" => "1", "episode" => "2", "title" => "Finale", "first_aired" => 1.week.ago.to_i} }
    let(:show) { Show.new }
    let(:user) { User.new }

    before(:each) do
      @api.stub(:all_aired_episodes).and_return([s01e01, s01e02])
      @pilot = Episode.create(:season_number => 1, 
                                :episode_number => 1, 
                                :name => "Pilot",
                                :show => show, 
                                :air_date => 2.weeks.ago)
    end

    it "saves new episodes" do    
      @fetcher.add_new_episodes(show)

      show.episodes.should have(2).episodes
    end

    it "does nothing if no new episodes have aired" do
      @api.stub(:all_aired_episodes).and_return([s01e01])

      show.episodes.should have(1).episodes
      
      @fetcher.add_new_episodes(show)

      show.episodes.should have(1).episodes
    end

    it "adds new episodes to users unwatched queue" do
      show.users << user

      @fetcher.add_new_episodes(show)
      user.user_watches.should have(1).episodes
    end

    it "does nothing if new episode has airdate of 0" do
      unaired = {"season" => "2", "episode" => "3", "title" => "Finale", "first_aired" => 0}
      @api.stub(:all_aired_episodes).and_return([s01e01, unaired])

      show.episodes.should have(1).episodes
      
      @fetcher.add_new_episodes(show)
      
      show.episodes.should have(1).episodes
    end
  end
end