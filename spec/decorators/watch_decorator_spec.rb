require 'spec_helper'

describe WatchDecorator do
  let(:show) { Show.new(:name => "Lost") }
  let(:episode) { Episode.create(:name => "Pilot", 
                               :season_number => 1, 
                               :episode_number => 1, 
                               :show => show, 
                               :air_date => Date.new(2012, 1, 1)
                              )
                }
  let(:source) { UserWatch.new(:episode => episode) }
  let(:decorator) { WatchDecorator.new(source) }

  it 'delegates show_name' do
    decorator.show_name.should == "Lost"
  end

  it 'delegates episode_name' do
    decorator.episode_name.should == "S01E01 - Pilot"
  end

  it "delegates aired_on" do
    decorator.aired_on.should == "Aired Sunday, Jan 01"
  end

  it "delegates episode_id" do
    decorator.episode_id.should == episode.id
  end
end
