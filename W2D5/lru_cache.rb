class LRUCache
  attr_reader :count, :add, :show, :list

   def initialize(size)
     @size = size
     @list = []
   end

   def count
     # returns number of elements currently in cache
     @list.count
   end

   def add(el)
     # adds element to cache according to LRU principle
     if @list.include?(el)
       @list.delete(el)
       @list << el
    elsif count >= @size
       @list.slice!(0,1)
       @list << el
     else
       @list << el
     end
   end

   def show
     # shows the items in the cache, with the LRU item first
     p @list
   end

   private
   # helper methods go here!

 end

 johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show
