require "spec_helper"

describe ShowTracker do
  before(:each) do
    @api = stub
    @tracker = ShowTracker.new(@api)
  end

  describe "#track_show" do
    let(:show) { Show.new }
    let(:user) { User.new }

    it "should add show to users list of tracked shows" do
      @tracker.track_show(user, show)
      
      user.shows.should include show
    end

    it "should not add duplicate shows" do
      @tracker.track_show(user,show)
      @tracker.track_show(user,show)

      user.shows.should have(1).items
    end

    it "should add episodes as watched when seen_all is true" do
      show.episodes << Episode.new
      show.episodes << Episode.new

      @tracker.track_show(user, show, true)

      user.user_watches.should have(2).items
      user.watched.should have(2).items
    end

    it "should add episodes as unwatched when seen_all is false" do
      show.episodes << Episode.new
      show.episodes << Episode.new

      @tracker.track_show(user, show, false)

      user.user_watches.should have(2).items
      user.unwatched.should have(2).items
    end
  end

  describe "#find_or_create" do
    let(:search_results) { [{"tvdb_id" => "123", "title" => "Facts of Life"}] }
    let(:s01e01) { {"season" => "1", "episode" => "1", "title" => "Pilot", "first_aired" => 2.weeks.ago.to_i} }
    let(:s01e02) { {"season" => "1", "episode" => "2", "title" => "Finale", "first_aired" => 1.week.ago.to_i} }
    
    before(:each) do
      @api.stub(:search).and_return(search_results)
      @api.stub(:all_aired_episodes).and_return([])
    end

    it "should create new show" do
      show = @tracker.find_or_create_show("Facts of Life")
      
      show.id.should_not be_nil
      show.name.should == "Facts of Life"
    end

    it "should populate aired episodes for new shows" do
      @api.stub(:all_aired_episodes).and_return([s01e01, s01e02])

      show = @tracker.find_or_create_show("Facts of Life")

      show.episodes.should have(2).episodes
      show.episodes.first.should be_instance_of Episode
    end

    it "should return existing show" do
      existing_show = Show.create(:slug => "123", :name => "Facts of Life")

      show = @tracker.find_or_create_show("Facts of Life")
      show.should == existing_show
    end

    it "should not create episodes with airdate of 0" do
      unknown_air = {"first_aired" => 0}
      @api.stub(:all_aired_episodes).and_return([unknown_air])

      show = @tracker.find_or_create_show("Facts of Life")
      show.episodes.should have(0).episodes
    end
  end
end