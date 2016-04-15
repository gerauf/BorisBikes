require 'van'

describe Van do

  let(:item) { double :item, working?: true }
  let(:broken_item) { double :broken_item, working?: false}

  it {is_expected.to respond_to(:pick_up).with(1).argument}
  it {is_expected.to respond_to(:drop_off_items)}
  it {is_expected.to respond_to(:drop_off_broken_items)}
  it {is_expected.to respond_to(:drop_off_working_items)}

  it "expects the van to have a DEFAULT CAPACITY of 10" do
    expect(Van::DEFAULT_CAPACITY).to eq 10
  end

  it "to have an instance variable to store items in" do
    expect(subject.list_stored_items).to eq []
  end

  describe "#pick_up" do
    it "stores the items in the van" do
      subject.pick_up(item)
      expect(subject.list_stored_items).to eq [item]
    end
    it "raises an error if there is no more storage space" do
      Van::DEFAULT_CAPACITY.times {subject.pick_up(item)}
      expect {subject.pick_up(item)}.to raise_error("piss off Ferg")
    end

  end

  describe "#drop_off_items" do
    it "drops items" do
      expect(subject.drop_off_items).to eq []
    end

    it "drop off all items in the van" do
      subject.pick_up(item)
      expect(subject.drop_off_items).to eq [item]
    end

    it "after items dropped off, the van will be empty" do
      3.times {subject.pick_up(item)}
      subject.drop_off_items
      expect(subject.list_stored_items).to eq []
    end
  end


  describe "#drop_off_broken_items" do
    it "drops off only broken items, using the working method on items" do
      subject.pick_up(item)
      subject.pick_up(broken_item)
      expect(subject.drop_off_broken_items).to eq [broken_item]
    end
    it "drops off only broken items regardless of order in storage, using the working method on items" do
      subject.pick_up(item)
      subject.pick_up(broken_item)
      subject.pick_up(broken_item)
      subject.pick_up(item)
      subject.pick_up(broken_item)
      subject.pick_up(broken_item)
      subject.pick_up(item)
      expect(subject.drop_off_broken_items).to eq [broken_item, broken_item, broken_item, broken_item]
    end

    it "raises an error if there are no broken items to drop off - 'No broken items in here mate'" do
      expect {subject.drop_off_broken_items}.to raise_error("No broken items in here mate")
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

    # it "drop off all items in the van" do
    #   subject.pick_up(item)
    #   expect(subject.drop_off_items).to eq [item]
    # end
    #
    # it "after items dropped off, the van will be empty" do
    #   3.times {subject.pick_up(item)}
    #   subject.drop_off_items
    #   expect(subject.list_stored_items).to eq []
    # end



end
