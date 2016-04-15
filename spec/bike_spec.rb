require 'bike'
describe Bike do

  it {is_expected.to respond_to :working?}
  it {is_expected.to respond_to :report_broken}
  it {is_expected.to respond_to :fix_bike}

  it 'when bike is reported broken return false' do
    expect(subject.report_broken).to eq false
  end

  it 'expects a bikes "working" attribute to be false after a bike has been reported broken' do
    subject.report_broken
    expect(subject.working?).to be_falsey
  end

  it "fixing a broken bike, fixes it" do
    subject.report_broken
    subject.fix_bike
    expect(subject.working?).to be_truthy
  end


end
