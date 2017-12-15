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
