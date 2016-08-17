class Event < ActiveRecord::Base
  has_many :attendants
  has_many :users, :through => :attendants

  SELF_TABLE = Event.table_name
  ORDER_HASH = {
    "created_at.desc" => "#{SELF_TABLE}.created_at desc",
    "created_at.asc" => "#{SELF_TABLE}.created_at asc",
    "event_time.desc" => "#{SELF_TABLE}.event_time desc",
    "event_time.asc" => "#{SELF_TABLE}.event_time asc"
  }


  def self.filter(opts={}) 
    opts = opts.with_indifferent_access
    opts.slice!(:limit, :order, :offset)
    # apply default order first 
    events = self.order("#{SELF_TABLE}.created_at desc");
    if opts[:limit].present?
      # max of 50 limit
      opts[:limit] = 50 if opts[:limit] > 50 
      opts[:limit] = 10 if opts[:limit] < 0
      events = events.limit(opts[:limit].to_i) 
    end
    events = events.offset(opts[:offset].to_i) if opts[:offset].present?
    
    if (opts[:order].present? && ORDER_HASH.has_key?(opts[:order]))
      # exclude earlier events
      events = events.except(:order)
      events = events.order(ORDER_HASH[opts[:order]])  
    end

    # selecting only ides so that latter whatever needed can be added 
    events = events.select(:id) 
    events
  end
end