  require 'docking_station'
  describe DockingStation do
    # it "return true or false when called on bike" do
    # expect(subject).to respond_to :release_bike
    it { is_expected.to respond_to :release_bike }

    it "gets a bike" do
      bicycle = subject.release_bike
      expect(bicycle).to be_working
    end

  end