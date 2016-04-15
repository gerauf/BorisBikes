require 'bike'
describe Bike do

it {is_expected.to respond_to :working?}

  it "gets broken" do
    expect(subject).to be_broken
  end

  #end
end
