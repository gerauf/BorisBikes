require 'garage'

describe Garage do
  let(:item) { double :item, working?: true, fix_bike: true }
  let(:broken_item) { double :broken_item, working?: false, fix_bike: true }
  it {is_expected.to respond_to(:pick_up).with(1).argument}
  it {is_expected.to respond_to(:fix_shit)}

  it "can list stored items" do
    expect(subject.list_stored_items).to eq []
  end

  describe "#pick_up" do
    it "stores the items in the garage" do
      subject.pick_up(item)
      expect(subject.list_stored_items).to eq [item]
    end
    it "raises an error if there is no more storage space" do
      Garage::DEFAULT_CAPACITY.times {subject.pick_up(item)}
      expect {subject.pick_up(item)}.to raise_error("piss off Ferg")
    end

    it 'can pick up arrays of items as well as single ones' do
      subject.pick_up([item,item])
      expect(subject.list_stored_items).to eq [item,item]
    end

  end

  describe "#drop_off_working_items" do
    it "drops off only working items, using the working method on items" do
      subject.pick_up(item)
      subject.pick_up(broken_item)
      expect(subject.drop_off_working_items).to eq [item]
    end
    it "drops off only working items regardless of order in storage, using the working method on items" do
      subject.pick_up(item)
      subject.pick_up(broken_item)
      subject.pick_up(broken_item)
      subject.pick_up(item)
      subject.pick_up(broken_item)
      subject.pick_up(broken_item)
      subject.pick_up(item)
      expect(subject.drop_off_working_items).to eq [item, item, item]
    end

    it "raises an error if there are no working items to drop off - 'Everything's bloody broken'" do
      expect {subject.drop_off_working_items}.to raise_error("Everything's bloody broken")
    end
  end

  describe "#fix_shit" do
    it 'fixes shit' do
      subject.pick_up(item)
      expect(item).to receive(:fix_bike)
      subject.fix_shit
    end

    it 'always returns nil' do
      subject.pick_up(item)
      expect(subject.fix_shit).to eq nil
    end

  end


end
