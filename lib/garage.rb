require_relative 'bike'

class Garage
  attr_reader :storage
  DEFAULT_CAPACITY = 20

  def initialize
    @storage = []
  end

  def pick_up(items)
    raise "piss off Ferg" if full?
    storage << items
    storage.flatten!
  end

  def drop_off_working_items
    raise "Everything's bloody broken" if storage.find {|item| item.working? == true} == nil
    working_items = []
    storage.each {|item| working_items << item if item.working? }
    @storage -= working_items
    working_items
  end

  def list_stored_items
    storage
  end

  def fix_shit
    storage.each {|item| item.fix_bike}
    nil
  end

  private
    def full?
      storage.size >= DEFAULT_CAPACITY
    end

end
