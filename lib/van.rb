require_relative 'bike'
class Van
  attr_reader :storage
  DEFAULT_CAPACITY = 10

  def initialize
    @storage = []
  end

  def pick_up(item)
    raise "piss off Ferg" if full?
    storage << item
    storage.flatten!
  end

  def list_stored_items
    storage
  end

  def drop_off_items
    storage.pop(storage.size)
  end

# The following two methods could be DRY by using a third private method based on status
  def drop_off_broken_items
    raise "No broken items in here mate" if storage.find {|item| item.working? == false} == nil
    broken_items = []
    storage.each {|item| broken_items << item if !item.working? }
    @storage -= broken_items
    broken_items
  end

  def drop_off_working_items
    raise "Everything's bloody broken" if storage.find {|item| item.working? == true} == nil
    working_items = []
    storage.each {|item| working_items << item if item.working? }
    @storage -= working_items
    working_items
  end


  private
    def full?
      storage.size >= DEFAULT_CAPACITY
    end



end
